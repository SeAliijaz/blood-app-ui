import "package:blood_app_ui/Constants/constants.dart";
import "package:blood_app_ui/Credientals-Screens/signup_screen.dart";
import "package:blood_app_ui/Screens/Home/home_screen.dart";
import "package:blood_app_ui/Widgets/custom_progress_indicator.dart";
import "package:blood_app_ui/Widgets/custom_text_form_field.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ///Controllers
  ///vars
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  ///loginForm
  void loginForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'email': userCredential.user!.email,
          });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        } else {
          showMessage('User not found');
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.code == 'user-not-found') {
          showMessage('User not found');
        } else if (e.code == 'wrong-password') {
          showMessage('Incorrect password');
        } else {
          showMessage(e.message.toString());
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        showMessage(e.toString());
      }
    }
  }

  bool? isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: isLoading
          ? Center(child: CustomProgressIndicator())
          : SafeArea(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset("assets/logo.svg"),
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize:
                                              Sizer(context).height * 0.040),
                                    ),

                                    ///Email Field
                                    CustomTextFormField(
                                      controller: _emailController,
                                      labelText: "Enter Email",
                                      prefixIcon: Icons.email_outlined,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Field Can'not be empty";
                                        }

                                        if (!RegExp(r'\S+@\S+\.\S+')
                                            .hasMatch(v)) {
                                          return 'Please enter a valid email address';
                                        }
                                        if (!v.contains("@") ||
                                            !v.contains("@gmail.com")) {
                                          return "Email Must have @gmail.com";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),

                                    ///PassWord field
                                    CustomTextFormField(
                                      controller: _passwordController,
                                      labelText: "Enter Password",
                                      prefixIcon: Icons.lock_outlined,
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
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
