import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screen/Bookingsummary.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorBookingScreen extends StatefulWidget {
  @override
  _DoctorBookingScreenState createState() => _DoctorBookingScreenState();
}

class _DoctorBookingScreenState extends State<DoctorBookingScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  String? selectedTimeSlot;

  List<String> morningSlots = ["9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM"];
  List<String> afternoonSlots = ["12:00 PM", "12:30 PM", "1:00 PM", "1:30 PM"];
  List<String> eveningSlots = ["5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM"];

  Widget _buildTimeSlotSection(String title, List<String> slots) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 10,
          children: slots.map((slot) {
            return ChoiceChip(
              label: Text(slot),
              selected: selectedTimeSlot == slot,
              onSelected: (bool selected) {
                setState(() {
                  selectedTimeSlot = slot;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _navigateToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TableCalendar(
                focusedDay: focusedDate,
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(Duration(days: 30)),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                    focusedDate = focusedDay; // Keep the focused day.
                  });
                },
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(formatButtonVisible: false),
                availableGestures: AvailableGestures.horizontalSwipe,
              ),
              SizedBox(height: 20),
              _buildTimeSlotSection("Morning Slots", morningSlots),
              SizedBox(height: 20),
              _buildTimeSlotSection("Afternoon Slots", afternoonSlots),
              SizedBox(height: 20),
              _buildTimeSlotSection("Evening Slots", eveningSlots),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedTimeSlot != null
                    ? () {
                  _navigateToDetailsPage(context);
                }
                    : null,
                child: Text('Request Booking'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                    minimumSize: Size(double.infinity, 50)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingDetailsPage extends StatefulWidget {
  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController problemController = TextEditingController();
  File? selectedFile; // Holds the selected file

  // Function to pick a file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'], // Allowed file types
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        birthdayController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visit Information',style: Theme.of(context).textTheme.displayLarge,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Handle information action
            },
          ),
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Patient Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: birthdayController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: "Weight (KG)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: problemController,
              decoration: InputDecoration(
                labelText: "Briefly describe the problem",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 15),
            Text(
              "Attach report & previous Prescriptions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: pickFile, // File picker is called here
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attach_file, color: Colors.black54),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        selectedFile != null
                            ? selectedFile!.path.split('/').last
                            : "JPG, PNG, PDF (Max No. of attachments:10MB)",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingSummaryScreen()));
                  // Handle submit action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Form submitted successfully")),
                  );
                },
                icon: Icon(Icons.arrow_forward),
                label: Text("Proceed Next"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50), // Make it full-width
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}