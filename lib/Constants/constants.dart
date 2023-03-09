import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppColors {
  static const Color primaryColor = Colors.redAccent;
  static Color secondaryColor = Colors.red.shade200;
}

///Flutter Toast
void showMessage(String msg) {
  Fluttertoast.showToast(msg: msg);
}

/// MediaQuery.of(context).size;
/// Just Changed the name
class Sizer {
  ///BuildContext
  BuildContext context;

  /// Sizer(this.context) : assert(context != null);
  Sizer(this.context);

  /// MediaQuery.of(context).size.height;
  double get height => MediaQuery.of(context).size.height;

  /// MediaQuery.of(context).size.width;
  double get width => MediaQuery.of(context).size.width;
}
