import "package:blood_app_ui/Constants/constants.dart";
import "package:blood_app_ui/Credientals-Screens/signup_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);
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
                          "Login",
                          style: TextStyle(
                              fontSize: Sizer(context).height * 0.040),
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
                        MaterialButton(
                          height: Sizer(context).height * 0.080,
                          minWidth: Sizer(context).width,
                          color: AppColors.primaryColor,
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ///SizedBox
            SizedBox(
              height: Sizer(context).height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SignUpScreen();
                    }));
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
