import 'package:blood_app_ui/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///for Drop Down Button
  String selectedValue = "A+";

  ///controllers
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ///Variables
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/logo.svg"),
                              Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: Sizer(context).height * 0.040),
                              ),
                              TextFormField(
                                controller: nameC,
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
                                  }
                                  if (v.length < 3) {
                                    return "Name should be greater than 3";
                                  } else {
                                    return null;
                                  }
                                },
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

                              ///SizedBox
                              SizedBox(height: 10),

                              ///DropdownButtonFormField
                              DropdownButtonFormField(
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "field should not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                disabledHint: Text("Can't select"),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.bloodtype_outlined),
                                  hintText: selectedValue,
                                  labelText: "Blood Type",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                items: dropdownItems,
                                value: selectedValue,
                                onChanged: (v) {
                                  selectedValue = v!;
                                },
                              ),
                              SizedBox(height: 05),
                              MaterialButton(
                                height: Sizer(context).height * 0.070,
                                minWidth: Sizer(context).width,
                                color: AppColors.primaryColor,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog _showDialogMethod() {
    String message =
        "This is Just Demo Screen With Validations, If You Want to Check App Go To LogIn Page";
    return AlertDialog(
      title: Text(
        "This Feature is Not Uploaded Yet!",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.message_outlined),
            title: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

///List<DropdownMenuItem<String>> get dropdownItems
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "A+", child: Text("A+")),
    DropdownMenuItem(value: "B+", child: Text("B+")),
    DropdownMenuItem(value: "A-", child: Text("A-")),
    DropdownMenuItem(value: "B-", child: Text("B-")),
    DropdownMenuItem(value: "AB+", child: Text("AB+")),
    DropdownMenuItem(value: "AB-", child: Text("AB-")),
    DropdownMenuItem(value: "O+", child: Text("O+")),
    DropdownMenuItem(value: "O-", child: Text("O-")),
  ];
  return menuItems;
}
