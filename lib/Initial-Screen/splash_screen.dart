import 'dart:async';
import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Credientals-Screens/login_screen.dart';
import 'package:blood_app_ui/Widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // start the timer when the screen loads
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // navigate to the next screen after 5 seconds
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogInScreen()));
    });
  }

  @override
  void dispose() {
    // cancel the timer when the screen is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return LogInScreen();
          }));
        },
        child: Container(
          height: 60,
          color: AppColors.primaryColor,
          child: Center(
              child: Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: SizedBox(
        height: Sizer(context).height,
        width: Sizer(context).width,
        child: SizedBox(
          height: Sizer(context).height,
          width: Sizer(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///SvgPicture
              SvgPicture.asset(
                "assets/logo.svg",
                height: Sizer(context).height * 0.25,
              ),

              ///SizedBox
              SizedBox(
                height: Sizer(context).height * 0.02,
              ),

              ///Text
              Text(
                "Blood Donation",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: Sizer(context).height * 0.04,
                  color: AppColors.primaryColor,
                ),
              ),

              ///SizedBox
              SizedBox(
                height: Sizer(context).height * 0.02,
              ),

              Center(child: CustomProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
