class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String hospital;
  final String contactNumber;
  final String email;
  final String imageUrl;
  final double rating;
  final List<String> availableTimes;
  final bool isOnline;
  final int experience; // Experience in years
  final double price; // Price for consultation

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.contactNumber,
    required this.email,
    required this.imageUrl,
    required this.rating,
    required this.availableTimes,
    this.isOnline = false,
    required this.experience,
    required this.price,
  });

  // Method to create a Doctor object from a JSON map
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      hospital: json['hospital'],
      contactNumber: json['contactNumber'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      availableTimes: List<String>.from(json['availableTimes']),
      isOnline: json['isOnline'] ?? false,
      experience: json['experience'],
      price: json['price'].toDouble(),
    );
  }

  // Method to convert a Doctor object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'hospital': hospital,
      'contactNumber': contactNumber,
      'email': email,
      'imageUrl': imageUrl,
      'rating': rating,
      'availableTimes': availableTimes,
      'isOnline': isOnline,
      'experience': experience,
      'price': price,
    };
  }
}

final List<Doctor> dummyDoctors = [
  Doctor(
    id: '1',
    name: 'Dr. John Doe',
    specialization: 'Cardiologist',
    hospital: 'City Hospital',
    contactNumber: '+1234567890',
    email: 'johndoe@hospital.com',
    imageUrl: "assets/images/doctor1.png",
    rating: 4.8,
    availableTimes: ['9:00 AM - 11:00 AM', '2:00 PM - 4:00 PM'],
    isOnline: true,
    experience: 10, // Experience in years
    price: 150.00,  // Price for consultation
  ),
  Doctor(
    id: '2',
    name: 'Dr. Jane Smith',
    specialization: 'Dermatologist',
    hospital: 'HealthCare Clinic',
    contactNumber: '+0987654321',
    email: 'janesmith@clinic.com',
    imageUrl: 'assets/images/doctor2.png',
    rating: 4.6,
    availableTimes: ['10:00 AM - 12:00 PM', '1:00 PM - 3:00 PM'],
    isOnline: false,
    experience: 8,  // Experience in years
    price: 120.00,  // Price for consultation
  ),

  Doctor(
    id: '3',
    name: 'Dr. Jane Smith',
    specialization: 'Dermatologist',
    hospital: 'HealthCare Clinic',
    contactNumber: '+0987654321',
    email: 'janesmith@clinic.com',
    imageUrl: 'assets/images/doctor2.png',
    rating: 4.6,
    availableTimes: ['10:00 AM - 12:00 PM', '1:00 PM - 3:00 PM'],
    isOnline: false,
    experience: 8,  // Experience in years
    price: 110.00,  // Price for consultation
  ),

  Doctor(
    id: '4',
    name: 'Dr. Jane Smith',
    specialization: 'Dermatologist',
    hospital: 'HealthCare Clinic',
    contactNumber: '+0987654321',
    email: 'janesmith@clinic.com',
    imageUrl: 'assets/images/doctor2.png',
    rating: 4.6,
    availableTimes: ['10:00 AM - 12:00 PM', '1:00 PM - 3:00 PM'],
    isOnline: false,
    experience: 8,  // Experience in years
    price: 100.00,  // Price for consultation
  ),
  // Add more doctors with experience and price here
];

