import 'package:blood_app_ui/Widgets/custom_progress_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _userDataStream;
  bool isLoading = false;
  @override
  void initState() {
    _userDataStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: isLoading
            ? Center(
                child: CustomProgressIndicator(),
              )
            : StreamBuilder<DocumentSnapshot>(
                stream: _userDataStream,
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    showMessage('Error: ${snapshot.error.toString()}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CustomProgressIndicator());
                  }
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return SizedBox(
                    height: Sizer(context).height,
                    width: Sizer(context).width,
                    child: Column(
                      children: [
                        ///Profile Image
                        _profileImage(),

                        ///ListTile
                        _list(
                          Icon(Icons.person_outline),
                          "Name",
                          userData["name"] ??
                              "Something Problem Occured,\nRegister Account Again!",
                        ),
                        _list(
                          Icon(Icons.email_outlined),
                          "Email",
                          userData["email"] ?? "Something Problem Occured",
                        ),

                        ///LogOut Button
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MaterialButton(
                            height: Sizer(context).height * 0.070,
                            minWidth: Sizer(context).width,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: AppColors.primaryColor,
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
  }

  Widget _profileImage() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        radius: 100,
        backgroundImage: CachedNetworkImageProvider(Photos.profileImage),
      ),
    );
  }

  Widget _list(
    Widget leading,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: ListTile(
          onTap: () {},
          iconColor: AppColors.primaryColor,
          textColor: Colors.black,
          leading: leading,
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.star_outline),
        ),
      ),
    );
  }
}
