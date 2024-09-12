import 'package:flutter/material.dart';
import 'package:mobile_app/model/doctor_model.dart';
import 'package:mobile_app/screen/doctor_detail_screen.dart';
import 'package:mobile_app/screen/doctor_screen.dart';
import 'package:mobile_app/widget/custom_appbar1.dart';
import 'package:mobile_app/widget/doc_slide.dart';
import 'package:mobile_app/widget/doctor_card.dart';
import 'package:mobile_app/widget/svg_container.dart';

class Clinicscreen extends StatefulWidget {
  const Clinicscreen({super.key});

  @override
  _ClinicscreenState createState() => _ClinicscreenState();
}

class _ClinicscreenState extends State<Clinicscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarr(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: DocSlide(),
            ),
            Padding(
              padding: const EdgeInsets.all(9.5),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorScreen()));},
                      child: SvgTextContainer(
                        svgPath: 'assets/images/doctor.svg',
                        text: 'Doctor',
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        textBackgroundColor: Colors.white,
                        textFontSize: 11,
                        textFontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    child: SvgTextContainer(
                      svgPath: 'assets/images/Calander.svg',
                      text: 'Appointment',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      textBackgroundColor: Colors.white,
                      textFontSize: 9.1,
                      textFontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    child: SvgTextContainer(
                      svgPath: 'assets/images/prescription.svg',
                      text: 'Prescription',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      textBackgroundColor: Colors.white,
                      textFontSize: 10,
                      textFontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 17),
                  Expanded(
                    child: SvgTextContainer(
                      svgPath: 'assets/images/medicine.svg',
                      text: 'Medicine',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      textBackgroundColor: Colors.white,
                      textFontSize: 11,
                      textFontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Doctors", style: Theme.of(context).textTheme.displayLarge),
                  TextButton(
                    onPressed: () {},
                    child: const Text("View All"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyDoctors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailScreen()));},
                      child: DoctorCard(doctor: dummyDoctors[index]));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Available Doctors", style: Theme.of(context).textTheme.displayLarge),
                  TextButton(
                    onPressed: () {},
                    child: const Text("View All"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyDoctors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return AvailableDoctorCard(doctor: dummyDoctors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableDoctorCard extends StatelessWidget {
  final Doctor doctor;

  const AvailableDoctorCard({required this.doctor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  doctor.imageUrl,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (doctor.isOnline)
                Positioned(
                  top: 3,
                  right: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      // Define action for the button when pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(2.0),
                    ),
                    child: const Text(
                      'Online',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  doctor.specialization,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${doctor.experience} years +',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${doctor.price.toStringAsFixed(2)} ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Define action for booking when pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4.0),
        ],
      ),
    );
  }
}
