import 'package:flutter/material.dart';

class WorkoutInProgressScreen extends StatefulWidget {
  final String workoutName; // Pass the workout name

  const WorkoutInProgressScreen({Key? key, required this.workoutName})
      : super(key: key);

  @override
  State<WorkoutInProgressScreen> createState() =>
      _WorkoutInProgressScreenState();
}

class _WorkoutInProgressScreenState extends State<WorkoutInProgressScreen> {
  Duration _elapsedTime = Duration.zero;
  Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    _stopwatch.start(); // Start the timer when the screen loads
    _updateTimer();
  }

  @override
  void dispose() {
    _stopwatch.stop(); // Stop the timer when the screen is disposed
    super.dispose();
  }

  void _updateTimer() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
    });
    Future.delayed(Duration(milliseconds: 100), _updateTimer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutName), // Display workout name
      ),
      body: Column(
        children: [
          // Timer
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                _formatDuration(_elapsedTime),
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
          ),

          // Exercise List
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Replace with the actual number of exercises
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exercise ${index + 1}', // Replace with actual exercise name
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Weight Input
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Weight',
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Sets Input
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Sets',
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Reps Input
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Reps',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Finish Workout Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Handle workout completion (stop timer, save data)
              },
              child: const Text('Finish Workout'),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to format the duration
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
