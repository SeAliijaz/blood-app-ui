import 'dart:async';

import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Initial-Screen/intro_screen.dart';
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
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      await Navigator.push(context, MaterialPageRoute(builder: (_) {
        return IntroScreen();
      }));
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

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
                return IntroScreen();
              }));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
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
