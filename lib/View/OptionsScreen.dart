import 'package:flutter/material.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  // Sample user data (replace with your actual data)
  String name = 'John Doe';
  int age = 30;
  double height = 180; // In centimeters
  final _weightController = TextEditingController();
  bool _isMetric = true; // Add a variable to track the unit system

  @override
  void dispose() {
    _weightController
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (your AppBar code)

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (your name, age, and height widgets)

            // Metric/Imperial Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Units:', style: TextStyle(fontSize: 18)),
                Switch(
                  value: _isMetric,
                  onChanged: (value) {
                    setState(() {
                      _isMetric = value;
                    });
                    // TODO: Save unit preference to database or local storage
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Weight Input
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText:
                    'Enter weight for today (${_isMetric ? 'kg' : 'lbs'})', // Update label
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // TODO: Save weight to database (consider converting units if needed)
              },
              child: const Text('Save Weight'),
            ),
          ],
        ),
      ),
    );
  }
}
