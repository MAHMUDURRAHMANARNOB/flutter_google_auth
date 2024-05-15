import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'email_auth_service.dart'; // Import your authentication service

class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();
  final EmailAuthService emailAuthService =
      EmailAuthService(); // Initialize your authentication service

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Call Google Sign-In method
                  authService.signInWithGoogle().then((userCredential) {
                    // Handle successful sign-in
                    print(
                        "User signed in with Google: ${userCredential.user!.displayName}");
                    // Navigate to next screen or perform other actions
                  }).catchError((error) {
                    // Handle sign-in error
                    print("Error signing in with Google: $error");
                    // Show error message or perform other actions
                  });
                },
                child: Text('Sign in with Google'),
              ),
              SizedBox(height: 20),
              Text(
                'OR',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform manual email/password authentication
                  // Retrieve email and password from text fields
                  String email =
                      'example@example.com'; // Replace with your logic to get email
                  String password =
                      'password'; // Replace with your logic to get password

                  // Call your authentication service method
                  emailAuthService
                      .signInWithEmailAndPassword(email, password)
                      .then((userCredential) {
                    // Handle successful sign-in
                    print(
                        "User signed in manually: ${userCredential.user!.email}");
                    // Navigate to next screen or perform other actions
                  }).catchError((error) {
                    // Handle sign-in error
                    print("Error signing in manually: $error");
                    // Show error message or perform other actions
                  });
                },
                child: Text('Sign in'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to signup screen
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
