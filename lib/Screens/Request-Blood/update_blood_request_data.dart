import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UpdateBloodRequestScreen extends StatefulWidget {
  final requestData;
  final String documentId;

  const UpdateBloodRequestScreen({
    Key? key,
    required this.requestData,
    required this.documentId,
  }) : super(key: key);

  @override
  _UpdateBloodRequestScreenState createState() =>
      _UpdateBloodRequestScreenState();
}

class _UpdateBloodRequestScreenState extends State<UpdateBloodRequestScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _hospitalController = TextEditingController();
  String _selectedBloodGroup = "";

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.requestData['name'];
    _ageController.text = widget.requestData['age'];
    _contactController.text = widget.requestData['contact'];
    _locationController.text = widget.requestData['location'];
    _hospitalController.text = widget.requestData['hospital'];
    _selectedBloodGroup = widget.requestData['bloodGroup'];
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> bloodRequest = {
        'name': _nameController.text,
        'age': _ageController.text,
        'contact': _contactController.text,
        'location': _locationController.text,
        'hospital': _hospitalController.text,
        'bloodGroup': _selectedBloodGroup,
      };

      FirebaseFirestore.instance
          .collection('bloodRequests')
          .doc(widget.documentId)
          .update(bloodRequest);

      Navigator.pop(context);
    }
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Blood Request'),
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
            "Update Details",
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/002-screen.svg",
                      height: Sizer(context).height * 0.22,
                    ),
                  ),

                  ///Name Field
                  CustomTextFormField(
                    prefixIcon: Icons.person_outlined,
                    labelText: 'Name',
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      } else {
                        return null;
                      }
                    },
                  ),

                  ///Age
                  CustomTextFormField(
                    prefixIcon: Icons.numbers_outlined,
                    labelText: 'Age',
                    controller: _ageController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Age';
                      } else {
                        return null;
                      }
                    },
                  ),

                  ///Contacts
                  CustomTextFormField(
                    prefixIcon: Icons.phone_outlined,
                    labelText: 'Contact Number',
                    controller: _contactController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Phone';
                      } else {
                        return null;
                      }
                    },
                  ),

                  ///Location
                  CustomTextFormField(
                    prefixIcon: Icons.location_city_outlined,
                    labelText: 'Location',
                    controller: _locationController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Location';
                      } else {
                        return null;
                      }
                    },
                  ),

                  ///Hospital
                  CustomTextFormField(
                    prefixIcon: Icons.location_city_outlined,
                    labelText: 'Hospital',
                    controller: _hospitalController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Hospital';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),

                  ///Blood Group
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          prefixIcon: Icon(MdiIcons.bloodBag),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelText: 'Blood Group'),
                      value: _selectedBloodGroup,
                      items: bloodGroups.map((group) {
                        return DropdownMenuItem<String>(
                          value: group,
                          child: Text(group),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedBloodGroup = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
