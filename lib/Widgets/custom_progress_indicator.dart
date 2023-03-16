import 'package:blood_app_ui/Constants/constants.dart';
import 'package:flutter/material.dart';

///CustomProgressIndicator
class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
      ),
    );
  }
}
