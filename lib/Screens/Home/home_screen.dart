import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Models/blood_card_model.dart';
import 'package:blood_app_ui/Screens/Home/details_screen.dart';
import 'package:blood_app_ui/Widgets/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool? isDetailsPage = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      showMessage(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Requests"),
      ),
      drawer: CustomDrawer(),
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
                            Navigator.push(context,
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
}
