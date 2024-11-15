import 'package:flutter/material.dart';

/*
TO IMPLEMENT: Assuming you have a DatabaseHelper class (as we discussed earlier) and a function to 
fetch workout data (e.g., getWorkouts()), you would use the WorkoutCard like this 

ListView.builder(
  itemCount: workoutHistory.length,
  itemBuilder: (context, index) {
    final workout = workoutHistory[index]; // Assuming workoutHistory is a List<Map<String, dynamic>>
    return WorkoutCard(
      workoutData: workout, // Pass the entire workout map
      onTap: () {
        // Show workout details popup
        // ...
      },
    );
  },
)
*/
class WorkoutCard extends StatelessWidget {
  final Map<String, dynamic> workoutData; // Use a map to store workout data
  final VoidCallback onTap;

  const WorkoutCard({
    Key? key,
    required this.workoutData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(workoutData['name']), // Access data from the map
        subtitle: Text(workoutData['date']),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
