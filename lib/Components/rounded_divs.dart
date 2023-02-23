import 'package:flutter/material.dart';
import '../Constants/constants.dart';

///Rounded Divs
Widget roundedDivs(BuildContext context) {
  return Container(
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: Sizer(context).height * 0.15,
            width: Sizer(context).width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: Sizer(context).height * 0.15,
            width: Sizer(context).width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
