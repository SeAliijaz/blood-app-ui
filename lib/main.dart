import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Initial-Screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///Title of app
      title: 'Blood-App-UI',

      ///debugShowCheckedModeBanner
      debugShowCheckedModeBanner: false,

      ///Setting Theme
      theme: ThemeData(
        ///Colors
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,

        ///appBarTheme
        appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
        ),

        ///Default Text Theme
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      ///Home
      home: SplashScreen(),
    );
  }
}
