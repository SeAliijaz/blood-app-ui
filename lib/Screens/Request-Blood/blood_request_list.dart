import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Screens/Request-Blood/blood_request_screen.dart';
import 'package:blood_app_ui/Widgets/custom_progress_indicator.dart';
import 'package:blood_app_ui/Widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'update_blood_request_data.dart';

class BloodRequestList extends StatefulWidget {
  @override
  _BloodRequestListState createState() => _BloodRequestListState();
}

class _BloodRequestListState extends State<BloodRequestList> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _bloodRequestsStream;

  @override
  void initState() {
    super.initState();

    _bloodRequestsStream = FirebaseFirestore.instance
        .collection('bloodRequests')
        .snapshots(includeMetadataChanges: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Requests List'),
      ),

      ///floatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BloodRequestScreen();
          }));
        },
        child: Icon(Icons.add),
      ),

      ///Stream Builder
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _bloodRequestsStream,
          builder: (context, snapshot) {
            ///conditions applied
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(child: CustomProgressIndicator());
            }

            ///conditions applied
            if (!snapshot.hasData) {
              return Center(child: CustomProgressIndicator());
            }

            ///conditions applied
            if (snapshot.hasError) {
              showMessage(snapshot.hasError.toString());
            }

            ///List<DocumentSnapshot<Map<String, dynamic>>>
            List<DocumentSnapshot<Map<String, dynamic>>> requests =
                snapshot.data!.docs;

            ///ListView.builder
            return requests.isEmpty || requests.length == 0
                ? titleProgressIndicator(context, "No Blood Requests found!")
                : ListView.separated(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      ///assigning variable
                      var requestData = requests[index].data();

                      ///ListTile
                      return ListTile(
                        iconColor: AppColors.primaryColor,

                        ///Edit Blood Request Details
                        leading: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return UpdateBloodRequestScreen(
                                requestData: requestData,
                                documentId: requests[index].id,
                              );
                            }));
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),

                        ///Blood Request Details
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${requestData!['name']}"),
                            Text("Age: ${requestData['age']}"),
                            Text("Contact: ${requestData['contact']}"),
                            Text("Location: ${requestData['location']}"),
                            Text("Hospital: ${requestData['hospital']}"),
                            Text("Blood Group: ${requestData['bloodGroup']}"),
                          ],
                        ),

                        ///Delete IconButton
                        trailing: IconButton(
                          onPressed: () {
                            ///Text
                            String text =
                                "Are You Sure You Want to Perform this Action?";

                            ///show dialog method
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    content: Text(
                                      text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      /// Navigator.of(context).pop();
                                      MaterialButton(
                                        child: Text(
                                          "No",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.red,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),

                                      ///Delete Document Button
                                      MaterialButton(
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.green,
                                        onPressed: () {
                                          /// get a reference to the document you want to delete
                                          DocumentReference documentReference =
                                              FirebaseFirestore.instance
                                                  .collection('bloodRequests')
                                                  .doc(requests[index].id);

                                          /// delete the document
                                          documentReference.delete();
                                          showMessage("Document is Removed!");
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      );
                    },

                    ///separatorBuilder
                    separatorBuilder: (BuildContext context, index) {
                      return const Divider(color: AppColors.primaryColor);
                    });
          }),
    );
  }
}
