import "package:blood_app_ui/Constants/constants.dart";
import "package:blood_app_ui/Credientals-Screens/signup_screen.dart";
import "package:blood_app_ui/Screens/home_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ///Controllers
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ///Email And Password validation
  String? email = "user@gmail.com", password = "user";

  void loginForm() {
    if (_formKey.currentState!.validate()) {
      try {
        if (emailC.text.trim() == email && passC.text.trim() == password) {
          goToPage(context, HomeScreen());
          showMessage("Login Successfull");
        } else {
          Error e = Error();
          showMessage(e.toString());
        }
      } catch (e) {
        showMessage(e.toString());
      }
    }
  }

  bool? isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Sizer(context).height * 0.80,
                  child: Card(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
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
                                controller: emailC,
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
                                  }
                                  if (!v.contains("user@gmail.com")) {
                                    return "Email Does'nt Matched!";
                                  }
                                  if (!v.contains("@") ||
                                      !v.contains("@gmail.com")) {
                                    return "Email Must have @gmail.com";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                controller: passC,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  labelText: "Enter Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObsecure = !isObsecure!;
                                      });
                                    },
                                    icon: Icon(
                                      isObsecure == false
                                          ? Icons.visibility_off
                                          : Icons.remove_red_eye,
                                    ),
                                  ),
                                ),
                                obscureText: isObsecure!,
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "Field Can'not be empty";
                                  }
                                  if (v.length < 4) {
                                    return "Password must be greater than 4";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              MaterialButton(
                                height: Sizer(context).height * 0.070,
                                minWidth: Sizer(context).width,
                                color: AppColors.primaryColor,
                                onPressed: () {
                                  loginForm();
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showMessage(
                                      "This Feature will be uploaded soon");
                                },
                                child: Text(
                                  "Reset Password",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),

                              ///Email and Password Tolder
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return _showDialogMethod();
                                          });
                                    },
                                    icon: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.exclamation,
                                        color: Colors.white,
                                        size: Sizer(context).height * 0.022,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ///SizedBox
                SizedBox(
                  height: Sizer(context).height * 0.04,
                ),

                ///REGISTER ACCOUNT TEXT
                Container(
                  child: Row(
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
                          goToPage(context, SignUpScreen());
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Dialog Method for login
  Widget _showDialogMethod() {
    return AlertDialog(
      title: Text("Use This Email & Password to Login"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text("Email"),
            subtitle: Text("user@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.password_outlined),
            title: Text("Password"),
            subtitle: Text("user"),
          ),
        ],
      ),
    );
  }
}
