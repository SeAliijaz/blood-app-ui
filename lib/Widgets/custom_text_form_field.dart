import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? onSaved;

  const CustomTextFormField({
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        controller: controller,
        onSaved: onSaved,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

///Title Progress Indicator

Widget titleProgressIndicator(BuildContext context, String? title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Text(
          title ?? "title",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Sizer(context).height * 0.030,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      SizedBox(height: 20),
      Center(
        child: CustomProgressIndicator(),
      ),
    ],
  );
}
