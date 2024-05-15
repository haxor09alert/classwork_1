import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double principal = 0.0;
  double interestRate = 0.0;
  double timeInYears = 0.0;
  double simpleInterest = 0.0;

  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Simple Interest Calculator',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // labelText: 'Enter Principal Amount',
                hintText: 'Enter Principal Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                principal = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // labelText: '',
                hintText: 'Enter Interest Rate (%)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                interestRate = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // labelText: 'Enter Time (Years)',
                hintText: 'Enter Time (Years)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                timeInYears = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 8.0,
              ),
              onPressed: () {
                setState(() {
                  // Basic error handling (check for non-numeric input)
                  if (principal <= 0 || interestRate <= 0 || timeInYears <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter valid values'),
                      ),
                    );
                  } else {
                    simpleInterest =
                        principal * interestRate * timeInYears / 100;
                  }
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Simple Interest: ₹$simpleInterest', // Assuming INR currency
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
