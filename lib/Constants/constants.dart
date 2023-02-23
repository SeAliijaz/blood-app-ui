import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppColors {
  static const Color primaryColor = Colors.redAccent;
  static Color secondaryColor = Colors.red.shade200;
  // static const primaryColor = Color(0xFFFFC107);
  // static const secondaryColor = Color(0xFF242430);
  // static const darkColor = Color(0xFF191923);
  // static const bodyTextColor = Color(0xFF8B8B8D);
  // static const bgColor = Color(0xFF1E1E28);
}

///Flutter Toast
void showMessage(String msg) {
  Fluttertoast.showToast(msg: msg);
}

/// MediaQuery.of(context).size;
/// Just Changed the name
class Sizer {
  BuildContext context;

  /// Sizer(this.context) : assert(context != null);
  Sizer(this.context);

  /// MediaQuery.of(context).size.height;
  double get height => MediaQuery.of(context).size.height;

  /// MediaQuery.of(context).size.width;
  double get width => MediaQuery.of(context).size.width;
}

goToPage(BuildContext context, Widget nextScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return nextScreen;
  }));
}
