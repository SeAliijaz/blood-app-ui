import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Screens/Request-Blood/blood_request_details.dart';
import 'package:blood_app_ui/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BloodRequestScreen extends StatefulWidget {
  @override
  _BloodRequestScreenState createState() => _BloodRequestScreenState();
}

class _BloodRequestScreenState extends State<BloodRequestScreen> {
  ///Controllers
  final _formKey = GlobalKey<FormState>();
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

  @override
  void dispose() {
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
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            Map<String, String> bloodRequest = {
              'name': nameController.text,
              'age': ageController.text,
              'contact': contactController.text,
              'location': locationController.text,
              "hospital": hospitalController.text,
              'bloodGroup': selectedBloodGroup,
            };

            goToPage(
              context,
              BloodRequestDetailsScreen(
                requestData: {
                  "name": nameController.text,
                  "age": ageController.text,
                  "contact": contactController.text,
                  "location": locationController.text,
                  "hospital": hospitalController.text,
                  "bloodGroup": selectedBloodGroup,
                },
              ),
            );
          }
        },
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
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: Sizer(context).height * 0.80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ///Image
                            SvgPicture.asset(
                              "assets/025-donor.svg",
                              height: Sizer(context).height * 0.22,
                            ),

                            ///Text
                            Center(
                              child: Text(
                                "Blood Request",
                                style: TextStyle(
                                    fontSize: Sizer(context).height * 0.040),
                              ),
                            ),

                            ///Name Field
                            CustomTextFormField(
                              labelText: "Enter Name",
                              prefixIcon: Icons.phone_outlined,
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onSaved: (v) {
                                nameController.text = v!;
                              },
                            ),

                            ///Age field
                            CustomTextFormField(
                              labelText: "Enter Age",
                              prefixIcon: Icons.numbers_outlined,
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your age';
                                }
                                return null;
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
                                return null;
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
                                }
                                return null;
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
                                }
                                return null;
                              },
                              onSaved: (v) {
                                hospitalController.text = v!;
                              },
                            ),

                            ///SizedBox
                            SizedBox(height: 10),

                            ///DropdownButtonFormField
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(MdiIcons.bloodBag),
                                  labelText: "Select Blood Group",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              value: selectedBloodGroup,
                              items: bloodGroups.map((group) {
                                return DropdownMenuItem<String>(
                                  value: group,
                                  child: Text(group),
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
                          ],
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
