import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Screens/News-Tips-Screen/news_tips_screen.dart';
import 'package:blood_app_ui/Screens/Profile/profile_screen.dart';
import 'package:blood_app_ui/Screens/Request-Blood/blood_request_screen.dart';
import 'package:blood_app_ui/Screens/Who-Can-Donate-Blood/who_can_donate_blood_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: Text(
                'Blood App UI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CustomListTile(
            leading: const Icon(Icons.person),
            title: 'Profile',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ProfileScreen();
              }));
            },
          ),
          CustomListTile(
            leading: const Icon(MdiIcons.bloodBag),
            title: 'Request Blood',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return BloodRequestScreen();
              }));
            },
          ),
          CustomListTile(
            leading: const Icon(MdiIcons.newspaper),
            title: 'News & Tips',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return NewsTipsScreen();
              }));
            },
          ),
          CustomListTile(
            leading: const Icon(MdiIcons.information),
            title: 'Who Can Donate Blood?',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return WhoCanDonateBloodScreen();
              }));
            },
          ),
          CustomListTile(
            leading: const Icon(Icons.logout),
            title: 'Logout',
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

///Custom ListTile
class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    this.leading,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          iconColor: AppColors.primaryColor,
          textColor: Colors.black,
          leading: leading,
          title: Text(title ?? "title"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
