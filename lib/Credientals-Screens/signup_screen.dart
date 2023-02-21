import 'package:blood_app_ui/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: Sizer(context).height * 0.80,
              child: Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/logo.svg"),
                        Text(
                          "Register",
                          style: TextStyle(
                              fontSize: Sizer(context).height * 0.040),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            labelText: "Enter Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Field Can'not be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Enter Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Field Can'not be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Field Can'not be empty";
                            }
                            if (v.length <= 5) {
                              return "Password must be greater than 5";
                            } else {
                              return null;
                            }
                          },
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.bloodtype_outlined),
                            hintText: "Blood Type",
                            labelText: "A+",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          items: [],
                          onChanged: (v) {},
                        ),
                        MaterialButton(
                          height: Sizer(context).height * 0.080,
                          minWidth: Sizer(context).width,
                          color: AppColors.primaryColor,
                          onPressed: () {},
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
