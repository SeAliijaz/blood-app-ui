import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Credientals-Screens/login_screen.dart';
import 'package:blood_app_ui/Models/blood_card_model.dart';
import 'package:blood_app_ui/Screens/Home/details_screen.dart';
import 'package:blood_app_ui/Screens/News-Tips-Screen/news_tips_screen.dart';
import 'package:blood_app_ui/Screens/Profile/profile_screen.dart';
import 'package:blood_app_ui/Screens/Request-Blood/blood_request_screen.dart';
import 'package:blood_app_ui/Screens/Who-Can-Donate-Blood/who_can_donate_blood_screen.dart';
import 'package:blood_app_ui/Widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final bool? isDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Requests"),
      ),
      drawer: customDrawer(context),
      body: Container(
        height: Sizer(context).height,
        width: Sizer(context).width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          "assets/032-blood_bag.svg",
                          height: Sizer(context).height * 0.18,
                        ),
                        Text(
                          "Donate Blood,\n Save Lives",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Sizer(context).height * 0.030,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///Text
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: const Text(
                    "Current Requests",
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),

              ///Here We will make cards
              Column(
                  children: bloodCardModel.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Card(
                    shadowColor: Colors.grey,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                    child: Column(
                      children: [
                        ListTile(
                          textColor: Colors.black,
                          title: Text("Patient Name"),
                          subtitle: Text(e.patientName!),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Needed by"),
                              Text(e.date!),
                            ],
                          ),
                        ),
                        ListTile(
                          textColor: Colors.black,
                          title: Text("Location"),
                          subtitle: Text(e.location!),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Blood type"),
                              Text(e.bloodType!),
                            ],
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                          height: Sizer(context).height * 0.060,
                          minWidth: Sizer(context).width,
                          color: AppColors.primaryColor,
                          onPressed: () {
                            ///Getting Values to next screen
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return DetailsScreen(
                                isSubmitted: e.isSubmitted,
                                patientName: e.patientName,
                                date: e.date,
                                location: e.location,
                                bloodType: e.bloodType,
                                submittedBy: e.submittedBy,
                              );
                            }));
                          },
                          child: Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
            ],
          ),
        ),
      ),
    );
  }

  Drawer customDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: Sizer(context).width,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/dp.jpg"),
                  ),
                  Text(
                    "Muhammad Ali",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "ExampleEmail@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          CustomListTile(
            leading: Icon(Icons.person_outline),
            title: "Profile",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeScreen();
              }));
            },
          ),
          CustomListTile(
            leading: Icon(Icons.bloodtype),
            title: "Request Blood",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeScreen();
              }));
            },
          ),
          CustomListTile(
            leading: Icon(Icons.notifications_outlined),
            title: "News & Tips",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeScreen();
              }));
            },
          ),
          CustomListTile(
            leading: Icon(Icons.question_mark_outlined),
            title: "Can i donate blood?",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomeScreen();
              }));
            },
          ),
          CustomListTile(
            leading: Icon(Icons.logout),
            title: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
