import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App Title
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.3, // 1/3 of screen height
                child: const Center(
                  child: Text(
                    'Workout App',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Username TextField
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              const SizedBox(height: 20),

              // Password TextField
              TextField(
                obscureText: true, // Hide password characters
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement login logic
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),

              // Create Account Label
              TextButton(
                onPressed: () {
                  // TODO: Navigate to create account screen
                },
                child: const Text('Create an Account'),
              ),
              const SizedBox(height: 10),

              // Forgot Password Label
              TextButton(
                onPressed: () {
                  // TODO: Navigate to forgot password screen
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
