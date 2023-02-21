import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Credientals-Screens/login_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return LogInScreen();
              }));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
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

              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
