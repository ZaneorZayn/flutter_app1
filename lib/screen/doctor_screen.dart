import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/model/doctor_model.dart';
import 'package:mobile_app/screen/doctor_detail_screen.dart';
import 'doctor_search.dart'; // Import your search screen

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0), // Increased height for AppBar with search bar
        child: AppBar(
          backgroundColor: Colors.blueAccent, // Set your preferred AppBar color
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Doctor',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false, // Align title to the left
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to search screen when tapping on the search bar
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorSearchScreen(
                          initialQuery: '', // Empty query to start
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.black54),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Find your suitable doctor!',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 14),
            child: Text(
              "Specialist",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: dummyDoctors.length,
              itemBuilder: (context, index) {
                final doctor = dummyDoctors[index];
                return ListTile(
                  leading: SizedBox(
                    width: 80, // Set the desired width
                    height: 150, // Set the desired height
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        doctor.imageUrl,
                        fit: BoxFit.cover, // Ensure the image covers the space
                      ),
                    ),
                  ),
                  title: Text(
                    doctor.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.specialization,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' ${doctor.experience} years +',
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ' \$${doctor.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        doctor.isOnline ? Icons.circle : Icons.circle_outlined,
                        color: doctor.isOnline ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${doctor.rating} ★',
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailScreen()));
                    // Handle list item tap if needed
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductBannerSlider(),
          ),
        ],
      ),
    );
  }
}

// ProductBannerSlider widget to display images in a slider

class ProductBannerSlider extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/commerce1.png',
    'assets/images/commerce2.png',
    'assets/images/commerce3.png',
    'assets/images/commerce4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.55, // Display two items at once
        scrollPhysics: const PageScrollPhysics(),
        onPageChanged: (index, reason) {
          // Optional: handle page change
        },
      ),
      items: imgList.map((item) => Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(item),
            fit: BoxFit.cover,
          ),
        ),
      )).toList(),
    );
  }
}
