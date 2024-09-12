import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingSummaryScreen extends StatefulWidget {
  @override
  _BookingSummaryScreenState createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  String? selectedPaymentMethod = "Cash"; // Default selected method is Cash
  final double paymentAmount = 5.15;
  final double totalPrice = 115.00;

  // List of banks with names and images
  List<Map<String, String>> banks = [
    {
      'name': 'Bank of America',
      'image': 'https://example.com/bank_of_america.png', // Replace with actual image path or network image
    },
    {
      'name': 'Wells Fargo',
      'image': 'https://example.com/wells_fargo.png', // Replace with actual image path or network image
    },
    {
      'name': 'Chase Bank',
      'image': 'https://example.com/chase_bank.png', // Replace with actual image path or network image
    },
  ];

  // Function to show the payment method selection bottom sheet
  void _showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.money),
                title: Text("Pay by Cash"),
                trailing: selectedPaymentMethod == "Cash"
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Icon(Icons.radio_button_unchecked),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = "Cash";
                  });
                  Navigator.pop(context); // Close bottom sheet
                },
              ),
              Divider(),
              Text(
                'Pay by Bank Transfer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // List of banks
              ...banks.map((bank) => ListTile(
                leading: Image.network(
                  bank['image']!, // Network image (replace with actual asset image in real apps)
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.account_balance); // Fallback if image fails to load
                  },
                ),
                title: Text(bank['name']!),
                trailing: selectedPaymentMethod == bank['name']
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Icon(Icons.radio_button_unchecked),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = bank['name'];
                  });
                  Navigator.pop(context); // Close bottom sheet
                },
              )),
            ],
          ),
        );
      },
    );
  }

  // Show success dialog with an SVG image
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/success.svg', // Replace with your SVG file path
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                "Payment Successful",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text("Your payment has been completed successfully."),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Function for when the user clicks Proceed to Payment
  void _proceedToPayment(BuildContext context) {
    if (selectedPaymentMethod != null) {
      _showSuccessDialog(context); // Show success dialog if a payment method is selected
    } else {
      // Show an error if no payment method is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a payment method first.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Summary',style: Theme.of(context).textTheme.displayLarge,),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Section at the top - Taking Full Width
            Container(
              width: double.infinity, // Make the container take full width
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Name: John Doe",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Appointment Date: 10/09/2024",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Doctor: Dr. Smith",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Price Breakdown Section
            Container(
              width: double.infinity, // Make the container take full width
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price Breakdown",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Base Price:", style: TextStyle(fontSize: 16)),
                      Text("\$100", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee:", style: TextStyle(fontSize: 16)),
                      Text("\$5", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("VAT:", style: TextStyle(fontSize: 16)),
                      Text("\$10", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Payment Method Section
            Container(
              width: double.infinity, // Make the container take full width
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Row: Icon and Change Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet, size: 30),
                          SizedBox(width: 10),
                          Text(
                            "Payment Method",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _showPaymentBottomSheet(context); // Show bottom sheet
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Second Row: Bank or Cash Icon and Name
                  Row(
                    children: [
                      Icon(
                        selectedPaymentMethod == "Cash"
                            ? Icons.money
                            : Icons.account_balance,
                        size: 24,
                      ),
                      SizedBox(width: 5),
                      Text(
                        selectedPaymentMethod!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Spacer(),

            // Button to Proceed to Payment
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _proceedToPayment(context);
                },
                child: Text('Proceed to Payment'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50), // Full-width button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
