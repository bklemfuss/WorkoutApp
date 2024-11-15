import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      // Added missing body property
      child: Column(
        children: [
          // Workouts Completed with Dropdown
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                // Text and Dropdown in a Row
                Row(
                  children: [
                    Text(
                      // Replace X with the actual number from the database
                      '{X} Workouts Completed',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        width: 10), // Add some space between text and dropdown
                    DropdownButton<String>(
                      items: const [
                        DropdownMenuItem(
                          child: Text('Weekly'),
                          value: 'weekly',
                        ),
                        DropdownMenuItem(
                          child: Text('Monthly'),
                          value: 'monthly',
                        ),
                        DropdownMenuItem(
                          child: Text('All Time'),
                          value: 'all_time',
                        ),
                      ],
                      onChanged: (value) {
                        // Handle dropdown selection change
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Start New Workout
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Start New Workout',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Start Recent',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height:
                        10), // Add some space between the heading and the cards
                SizedBox(
                  height: 150, // Set a fixed height for the card container
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal, // Make the list scroll horizontally
                    itemCount:
                        3, // Replace with the actual number of recent workouts
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: 150, // Set a fixed width for each card
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Workout ${index + 1}', // Replace with the actual workout name
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ), // Added missing comma
        ],
      ),
    )); // Removed extra ) and ,
  }
}
