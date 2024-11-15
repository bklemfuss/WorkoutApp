import 'package:flutter/material.dart';
import 'WorkoutInProgress.dart';

class StartWorkoutScreen extends StatelessWidget {
  const StartWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "My Workouts" Section
            const Text(
              'My Workouts',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              // Use Expanded to fill available space
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6, // Replace with the actual number of workouts
                itemBuilder: (context, index) {
                  return InkWell(
                    // Make the cards tappable
                    onTap: () {
                      // 1. Get the workout data for the selected workout (from your data source)
                      // For example, if your data is a list of maps:
                      // Map<String, dynamic> selectedWorkout = workouts[index];

                      // 2. Navigate to the WorkoutInProgressScreen, passing the workout data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutInProgressScreen(
                            workoutName:
                                'Default Workout', // Placeholder Pass the workout name
                            //workoutName: selectedWorkout['name'], // Pass the workout name
                            // ... pass other workout data (exercises, etc.) ...
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Center(
                        child: Text(
                          'Workout ${index + 1}', // Replace with actual workout name
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // "Premade" Section
            const Text(
              'Premade',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              // Use Expanded to fill available space
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount:
                    3, // Replace with the actual number of premade workouts
                itemBuilder: (context, index) {
                  return InkWell(
                    // Make the cards tappable
                    onTap: () {
                      // TODO: Handle premade workout selection
                    },
                    child: Card(
                      child: Center(
                        child: Text(
                          'Premade ${index + 1}', // Replace with actual workout name
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Handle "Quick Start Empty" action
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
