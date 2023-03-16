import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Screens/Request-Blood/blood_request_list.dart';
import 'package:blood_app_ui/Widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BloodRequestScreen extends StatefulWidget {
  const BloodRequestScreen({super.key});

  @override
  _BloodRequestScreenState createState() => _BloodRequestScreenState();
}

class _BloodRequestScreenState extends State<BloodRequestScreen> {
  ///Form key
  final _formKey = GlobalKey<FormState>();

  ///Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  ///variables
  String selectedBloodGroup = 'A+';

  ///blood groups
  List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  void _submitForm() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (_formKey.currentState!.validate()) {
      Map<String, String> bloodRequest = {
        'name': nameController.text,
        'age': ageController.text,
        'contact': contactController.text,
        'location': locationController.text,
        'hospital': hospitalController.text,
        'bloodGroup': selectedBloodGroup,
      };

      try {
        await firestore
            // .doc("Blood_Requests-Path")
            .collection('bloodRequests')
            // .get();
            .add(bloodRequest);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BloodRequestList(),
          ),
        );
      } catch (e) {
        showMessage("Error adding blood request: ${e.toString()}");
      }
    }
  }

  @override
  void dispose() {
    ///dispose
    nameController.dispose();
    ageController.dispose();
    contactController.dispose();
    locationController.dispose();
    hospitalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation Request'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BloodRequestList();
                }));
              },
              icon: Icon(Icons.list_outlined)),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          _submitForm();
        },

        ///Button
        child: Container(
          height: 60,
          color: AppColors.primaryColor,
          child: Center(
              child: Text(
            "Submit Request",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: Container(
        height: Sizer(context).height,
        width: Sizer(context).width,
        child: Form(
          key: _formKey,
          child: Container(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: Sizer(context).height * 0.950,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///Image
                              SvgPicture.asset(
                                "assets/025-donor.svg",
                                height: Sizer(context).height * 0.22,
                              ),
                              SizedBox(height: 20),

                              ///Name Field
                              CustomTextFormField(
                                labelText: "Enter Name",
                                prefixIcon: Icons.person_outlined,
                                controller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  if (value.length < 3) {
                                    return "Name should be 3+";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (v) {
                                  nameController.text = v!;
                                },
                              ),

                              ///Age field
                              CustomTextFormField(
                                labelText: "Enter Age",
                                prefixIcon: MdiIcons.numeric,
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your age';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (v) {
                                  ageController.text = v!;
                                },
                              ),

                              ///contact number field
                              CustomTextFormField(
                                labelText: "Enter Contact Number",
                                prefixIcon: Icons.phone_outlined,
                                controller: contactController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your contact number';
                                  }
                                  if (int.parse(value) < 1 &&
                                      int.parse(value) > 11) {
                                    return "Please Enter 11 digits number";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (v) {
                                  contactController.text = v!;
                                },
                              ),

                              ///Location field
                              CustomTextFormField(
                                labelText: "Enter Location",
                                prefixIcon: Icons.map_outlined,
                                controller: locationController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your location';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (v) {
                                  locationController.text = v!;
                                },
                              ),

                              ///Hospital field
                              CustomTextFormField(
                                labelText: "Enter Hospital Name and location",
                                prefixIcon: Icons.local_hospital_outlined,
                                controller: hospitalController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your location';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (v) {
                                  hospitalController.text = v!;
                                },
                              ),

                              ///------------------------------
                              ///---> DropdownButtonFormField |
                              ///---> To Select Blood Group   |
                              ///------------------------------
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(MdiIcons.bloodBag),
                                      labelText: "Select Blood Group",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  value: selectedBloodGroup,
                                  items: bloodGroups.map((bloodGroups) {
                                    return DropdownMenuItem<String>(
                                      value: bloodGroups,
                                      child: Text(bloodGroups),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBloodGroup = value!;
                                    });
                                  },
                                  onSaved: (v) {
                                    selectedBloodGroup = v!;
                                  },
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
