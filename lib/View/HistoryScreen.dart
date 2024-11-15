import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Sample workout data (replace with your actual data)
  final List<Map<String, dynamic>> workoutHistory = [
    {
      'name': 'Chest and Triceps',
      'date': '2024-11-13',
      'exercises': [
        {'name': 'Bench Press', 'weight': 135, 'sets': 3, 'reps': 8},
        {'name': 'Incline Dumbbell Press', 'weight': 50, 'sets': 3, 'reps': 10},
        // ... more exercises
      ],
    },
    // ... more workout data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // TODO: Show calendar (you can use showDatePicker or a custom calendar widget)
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workoutHistory.length,
        itemBuilder: (context, index) {
          final workout = workoutHistory[index];
          return Card(
            child: ListTile(
              title: Text(workout['name']),
              subtitle: Text(workout['date']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Show workout details popup
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(workout['name']),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Date: ${workout['date']}'),
                          const SizedBox(height: 10),
                          // Exercise details
                          ...workout['exercises'].map((exercise) => Text(
                                '${exercise['name']}: ${exercise['weight']} lbs x ${exercise['sets']} sets x ${exercise['reps']} reps',
                              )),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
