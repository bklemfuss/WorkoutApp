import 'package:flutter/material.dart';
// Import your charting library (e.g., fl_chart, syncfusion_flutter_charts)
// import 'package:fl_chart/fl_chart.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String _selectedTimeframe = '1 month'; // Initial timeframe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: ListView(
        children: [
          // Workouts per Week
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Workouts per Week',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DropdownButton<String>(
                          value: _selectedTimeframe,
                          items: const [
                            DropdownMenuItem(
                              value: '1 month',
                              child: Text('1 month'),
                            ),
                            DropdownMenuItem(
                              value: '3 months',
                              child: Text('3 months'),
                            ),
                            DropdownMenuItem(
                              value: '6 months',
                              child: Text('6 months'),
                            ),
                            DropdownMenuItem(
                              value: '1 year',
                              child: Text('1 year'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedTimeframe = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      // Use your charting library to display the chart here
                      // Example with fl_chart:
                      // padding: const EdgeInsets.all(16.0),
                      // child: LineChart(
                      //   LineChartData(
                      //     // ... your chart data and styling ...
                      //   ),
                      // ),
                      padding: const EdgeInsets.all(16.0),
                      child: Placeholder(), // Placeholder for the chart
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Weight
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Card(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Placeholder(), // Placeholder for the chart
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BMI
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Card(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Placeholder(), // Placeholder for the chart
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add more statistics sections here...
        ],
      ),
    );
  }
}
