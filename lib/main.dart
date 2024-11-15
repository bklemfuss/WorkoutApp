import 'package:flutter/material.dart';
import 'View/HomeScreen.dart'; // Import your HomeScreen widget
import 'View/HistoryScreen.dart';
import 'View/StatisticsScreen.dart';
import 'View/OptionsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // AppBar in the main Scaffold
            leading: Icon(Icons.fitness_center),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Workout App'),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              HistoryScreen(),
              StatisticsScreen(),
              OptionsScreen(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.history), text: 'History'),
              Tab(icon: Icon(Icons.bar_chart), text: 'Stats'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
