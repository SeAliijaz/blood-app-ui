import 'package:blood_app_ui/Credientals-Screens/login_screen.dart';
import 'package:blood_app_ui/Screens/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          // User is already signed in, show the home screen
          return HomeScreen();
        } else {
          // User is not signed in, show the login screen
          return LogInScreen();
        }
      },
    );
  }
}
