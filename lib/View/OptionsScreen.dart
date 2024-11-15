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
      appBar: AppBar(
        title: const Text('Options'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with your profile picture URL
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Age
            Text(
              'Age: $age',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Height
            Text(
              'Height: $height cm',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

// Metric/Imperial Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Units:', style: TextStyle(fontSize: 18)),
                Row(
                  // Wrap the Switch and Text in a Row
                  children: [
                    Text(_isMetric ? 'kg' : 'lbs'), // Display the unit here
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
              ],
            ),
            const SizedBox(height: 20),

// Weight Input
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter weight for today', // Remove unit from label
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
