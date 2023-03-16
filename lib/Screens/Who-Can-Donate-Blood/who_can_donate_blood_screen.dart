import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Models/who_can_donate_blood_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class WhoCanDonateBloodScreen extends StatelessWidget {
  const WhoCanDonateBloodScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Who Can Donate Blood?"),
      ),
      body: ListView.separated(
        itemCount: whoCanDonateModel.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: AppColors.primaryColor);
        },
        itemBuilder: (BuildContext context, int index) {
          final WhoCanDonateBloodModel value = whoCanDonateModel[index];
          return ListTile(
            iconColor: AppColors.primaryColor,
            textColor: Colors.black,
            leading: Icon(value.iconData),
            title: Text(value.title),
            trailing: IconButton(
              onPressed: () {
                Share.share(value.title);
                showMessage("Sharing!");
              },
              icon: const Icon(Icons.share_outlined),
            ),
          );
        },
      ),
    );
  }
}
