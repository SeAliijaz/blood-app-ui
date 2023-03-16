import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppColors {
  static const Color primaryColor = Colors.redAccent;
  static Color secondaryColor = Colors.red.shade200;
}

/// Flutter Toast
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

class Photos {
  static const String profileImage =
      "https://scontent.flhe13-1.fna.fbcdn.net/v/t39.30808-6/273325549_125774646633316_4540171477980727382_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEBWwDdpui0fxf-eWm4-L7joDLfOsJvV8OgMt86wm9Xw7utBmbv-vPnJnUwnZwR1p6KvF2JurRzrYEiWHpHDmSr&_nc_ohc=IK9m3wLqxvIAX88Dt-a&_nc_ht=scontent.flhe13-1.fna&oh=00_AfCF_9_wz5vy-7yZknFbw1W8J6gl2cR57--y-9EgmKNLVQ&oe=64190EC7";
}
