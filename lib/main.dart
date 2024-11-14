import 'package:flutter/material.dart';
import 'View/HomeScreen.dart'; // Import your HomeScreen widget

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
            title: const Text('Workout App'),
          ),
          body: TabBarView(
            // TabBarView in the body
            children: [
              HomeScreen(),
              Center(child: Text('History Screen')),
              Center(child: Text('Stats Screen')),
              Center(child: Text('Settings Screen')),
            ],
          ),
          bottomNavigationBar: const TabBar(
            // TabBar at the bottom
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
