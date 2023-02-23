import 'package:blood_app_ui/Constants/constants.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  bool? isSubmitted = false;
  String? patientName;
  String? date;
  String? location;
  String? bloodType;
  String? submittedBy;

  DetailsScreen({
    Key? key,
    this.isSubmitted,
    this.patientName,
    this.date,
    this.location,
    this.bloodType,
    this.submittedBy,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Blood Request Details'),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text("Submitted By"),
              subtitle: widget.isSubmitted == true
                  ? Text("${widget.submittedBy} On ${widget.date}")
                  : Text("Not Submitted Yet"),
            ),
            ListTile(
              title: Text("Patient Name"),
              subtitle: Text(widget.patientName!),
            ),
            ListTile(
              title: Text("Location"),
              subtitle: Text(widget.location!),
            ),
            ListTile(
              title: Text("Blood Type"),
              subtitle: Text("A+"),
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.directions_outlined,
                      color: AppColors.primaryColor,
                    ),
                    label: Text(
                      "Get Directions",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    )),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: AppColors.primaryColor,
                    ),
                    label: Text(
                      "Share",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    )),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                shape: StadiumBorder(),
                height: Sizer(context).height * 0.060,
                minWidth: Sizer(context).width * 0.80,
                color: AppColors.primaryColor,
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showMessage("This Feature will be added soon");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                shape: StadiumBorder(),
                height: Sizer(context).height * 0.060,
                minWidth: Sizer(context).width * 0.80,
                color: Colors.green,
                child: Text(
                  "Mark as Fulfilled",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showMessage("Marked as Fulfilled");
                },
              ),
            ),
          ],
        ));
  }
}
