import 'package:blood_app_ui/Constants/constants.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
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
              subtitle: Text("Ali on 19/02/2023"),
            ),
            ListTile(
              title: Text("Patient Name"),
              subtitle: Text("Ahmad"),
            ),
            ListTile(
              title: Text("Location"),
              subtitle: Text("Sahiwal, Punjab Pakistan"),
            ),
            ListTile(
              title: Text("Submitted By"),
              subtitle: Text("Ali on 19/02/2023"),
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
              padding: const EdgeInsets.all(25.0),
              child: MaterialButton(
                shape: StadiumBorder(),
                height: Sizer(context).height * 0.060,
                minWidth: Sizer(context).width,
                color: AppColors.primaryColor,
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MaterialButton(
                shape: StadiumBorder(),
                height: Sizer(context).height * 0.060,
                minWidth: Sizer(context).width,
                color: Colors.green,
                child: Text(
                  "Mark as Fulfilled",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
