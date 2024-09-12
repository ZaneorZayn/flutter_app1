import 'package:flutter/material.dart';
import 'package:mobile_app/model/doctor_model.dart';

class DoctorSearchScreen extends StatefulWidget {
  final String initialQuery;

  const DoctorSearchScreen({Key? key, required this.initialQuery}) : super(key: key);

  @override
  _DoctorSearchScreenState createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    searchController.text = widget.initialQuery;
    searchController.addListener(() => searchDoctor(searchController.text));
    searchDoctor(widget.initialQuery);
  }

  void searchDoctor(String query) {
    final suggestions = dummyDoctors.where((doctor) {
      final doctorName = doctor.name.toLowerCase();
      final doctorSpecialization = doctor.specialization.toLowerCase();
      final input = query.toLowerCase();

      return doctorName.contains(input) || doctorSpecialization.contains(input);
    }).toList();

    setState(() {
      filteredDoctors = suggestions;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search for a doctor',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          cursorColor: Colors.white, // Ensures the cursor is visible
        ),
      ),
      body: filteredDoctors.isNotEmpty
          ? ListView.builder(
        itemCount: filteredDoctors.length,
        itemBuilder: (context, index) {
          final doctor = filteredDoctors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(doctor.imageUrl),
            ),
            title: Text(doctor.name),
            subtitle: Text(doctor.specialization),
            trailing: doctor.isOnline
                ? Icon(Icons.circle, color: Colors.green, size: 12.0)
                : Icon(Icons.circle, color: Colors.red, size: 12.0),
            onTap: () {
              // Handle doctor selection
            },
          );
        },
      )
          : Center(
        child: Text(
          'No doctors found',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
