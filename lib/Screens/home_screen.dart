import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Requests"),
      ),
      drawer: Drawer(),
      body: Container(
        height: Sizer(context).height,
        width: Sizer(context).width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
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
                    "Cureent Requests",
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),

              ///Here We will make cards
              Column(
                children: [
                  CustomBloodCard(),
                  CustomBloodCard(),
                  CustomBloodCard(),
                  CustomBloodCard(),
                  CustomBloodCard(),
                  CustomBloodCard(),
                  CustomBloodCard(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBloodCard extends StatelessWidget {
  const CustomBloodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              title: Text("Patient Name"),
              subtitle: Text("Title 1"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Needed by"),
                  Text("18/09/2023"),
                ],
              ),
            ),
            ListTile(
              title: Text("Location"),
              subtitle: Text("Location 1"),
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailsScreen();
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
  }
}
