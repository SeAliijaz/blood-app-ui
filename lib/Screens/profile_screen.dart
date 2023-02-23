import 'package:blood_app_ui/Components/rounded_divs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          height: Sizer(context).height,
          width: Sizer(context).width,
          child: Column(
            children: [
              ///Rounded Containers
              Stack(
                children: [
                  ///Rounded Containers
                  roundedDivs(context),

                  ///Profile Pic
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundColor: AppColors.secondaryColor,
                        radius: Sizer(context).height * 0.10,
                        backgroundImage: AssetImage("assets/dp.jpg"),
                      ),
                    ),
                  ),
                ],
              ),

              ///Intro
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/033-blood_drop.svg",
                      height: Sizer(context).height * 0.08,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Muhammad Ali",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 5),
                        Text(
                          "Example@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/033-blood_drop.svg",
                      height: Sizer(context).height * 0.08,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizer(context).height * 0.02,
              ),

              ///Profile Card
              _profileCard(context),
            ],
          ),
        ));
  }

  ///Profile Card
  Widget _profileCard(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Card(
          elevation: 5,
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
                subtitle: Text("Dummy Patient Name"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Needed by"),
                    Text("Dummy Date"),
                  ],
                ),
              ),
              ListTile(
                textColor: Colors.black,
                title: Text("Location"),
                subtitle: Text("Dummy Location"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Blood type"),
                    Text("A+"),
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
                  showMessage("This Feature is Not Uploaded Yet!");
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
