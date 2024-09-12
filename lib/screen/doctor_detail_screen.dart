import 'package:flutter/material.dart';
import 'package:mobile_app/screen/book_appointment.dart';

class DoctorDetailScreen extends StatefulWidget {
  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // Set the AppBar color
        title: Text('Doctor Profile',style: Theme.of(context).textTheme.displayLarge,),
        centerTitle: true,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                )
            ),
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Share action
            },
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              )
            ),
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Doctor's profile and fee section
          Container(
            padding: const EdgeInsets.only(top:16,left: 16,right: 16),
            color: Colors.lightBlue[100], // Background color for the top part
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor's image with ClipRRect to avoid overflow
                // Rounded corners
                  Image.asset(
                    'assets/images/doctor.png', // Update with actual image path
                    width: 150,
                    height: 120,
                     // Ensures the image covers the container
                  ),

                const SizedBox(width: 16),
                // Consultation fee and other details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 8),
                    Text(
                      '\$99 Consultation Fee \n(Inc. VAT)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Doctor name, specialization, and reviews
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr. Toy Sarash',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Dentist - Cumilla Medical College'),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.person, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('2.05K Patients'),
                    SizedBox(width: 16),
                    Icon(Icons.star, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('5K Reviews'),
                    SizedBox(width: 16),
                    Icon(Icons.event, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('10 Years Experience'),
                  ],
                ),
              ],
            ),
          ),

          // Fixed-width and height TabBar
          Container(
            color: Colors.grey[200], // Background color of TabBar
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.blue.withOpacity(0.8), // Background color for selected tab
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 0), // Removes default padding
              tabs: [
                _buildTab('Info'),
                _buildTab('Experience'),
                _buildTab('Review'),
              ],
            ),
          ),

          // TabBarView for Info, Experience, and Review
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildInfoTab(),
                _buildExperienceTab(),
                _buildReviewTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Notch shape
        notchMargin: 6.0,
        child: Row(
          children: [
            // "Call Now" Button taking half the available space
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Call Now action
                },
                icon: const Icon(Icons.call, color: Colors.black),
                label: const Text('Call Now', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white, // Button background color
                  padding: const EdgeInsets.symmetric(vertical: 16.0), // Increase button height
                ),
              ),
            ),
            const SizedBox(width: 16),
            // "Book" Button taking half the available space
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorBookingScreen()));
                  // Book action
                },
                icon: const Icon(Icons.calendar_today, color: Colors.white),
                label: const Text(
                  'Book',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onSecondary, // Custom background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0), // Increase button height
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a tab with fixed width and height
  Widget _buildTab(String title) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 3, // Divide the screen width by the number of tabs
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Info Tab Content
  Widget _buildInfoTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'About Doctor',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Molestiae possimus, nulla voluptatum commodi unde assumenda deleniti ullam ex.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Experience Tab Content
  Widget _buildExperienceTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Experience',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '10 years of experience in Dentistry, with expertise in orthodontics and cosmetic surgery.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Review Tab Content
  Widget _buildReviewTab() {
    // Example list of reviews with user, date, rating, and text
    final List<Map<String, dynamic>> reviews = [
      {
        'user': 'John Doe',
        'date': 'Sep 4, 2024',
        'rating': 4,
        'review': 'Great experience with the doctor. Highly recommend!'
      },
      {
        'user': 'Jane Smith',
        'date': 'Aug 20, 2024',
        'rating': 5,
        'review': 'The doctor was very professional and attentive to my concerns.'
      },
      {
        'user': 'Alice Johnson',
        'date': 'Jul 15, 2024',
        'rating': 3,
        'review': 'It was okay, but I had to wait longer than expected.'
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: reviews.length,  // Corrected here to use reviews length
      itemBuilder: (context, index) {
        final review = reviews[index];
        return _buildReviewTile(
          user: review['user'] as String,
          date: review['date'] as String,
          rating: review['rating'] as int,
          reviewText: review['review'] as String,
        );
      },
    );
  }

// Helper method to build each review tile
  Widget _buildReviewTile({
    required String user,
    required String date,
    required int rating,
    required String reviewText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildStarRating(rating),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                reviewText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Helper method to build star rating
  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow[700],
          size: 20,
        );
      }),
    );
  }
}
