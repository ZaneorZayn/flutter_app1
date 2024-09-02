import 'package:flutter/material.dart';
import 'package:mobile_app/model/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({required this.doctor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              doctor.imageUrl,
              height: 150,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              doctor.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              doctor.specialization,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}


