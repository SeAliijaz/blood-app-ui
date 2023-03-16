import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Screens/Home/home_screen.dart';
import 'package:blood_app_ui/Widgets/custom_progress_indicator.dart';
import 'package:blood_app_ui/Widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///controllers
  ///Variables
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool? isObsecure = false;

  ///SignUp Form
  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'name': _nameController.text,
            'email': userCredential.user!.email,
          });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.code == 'weak-password') {
          showMessage('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showMessage('The account already exists for that email.');
        } else {
          showMessage(e.message!);
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        showMessage(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: isLoading
          ? Center(
              child: CustomProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: Sizer(context).height * 0.90,
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
                                      "Register",
                                      style: TextStyle(
                                          fontSize:
                                              Sizer(context).height * 0.040),
                                    ),

                                    ///Name Field
                                    CustomTextFormField(
                                      controller: _nameController,
                                      labelText: "Enter Name",
                                      prefixIcon: Icons.person_outline,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Field Can'not be empty";
                                        }
                                        if (v.length < 3) {
                                          return "Name should be greater than 3";
                                        } else {
                                          return null;
                                        }
                                      },
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

                                    ///Password field
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

                                    ///SizedBox
                                    SizedBox(height: 10),

                                    ///Button<
                                    MaterialButton(
                                      height: Sizer(context).height * 0.070,
                                      minWidth: Sizer(context).width,
                                      color: AppColors.primaryColor,
                                      onPressed: () {
                                        submitForm();
                                      },
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
