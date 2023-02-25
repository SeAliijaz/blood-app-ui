import 'package:blood_app_ui/Constants/constants.dart';
import 'package:blood_app_ui/Models/news_tips_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NewsTipsScreen extends StatefulWidget {
  const NewsTipsScreen({Key? key}) : super(key: key);

  @override
  State<NewsTipsScreen> createState() => _NewsTipsScreenState();
}

class _NewsTipsScreenState extends State<NewsTipsScreen> {
  final bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News And Tips'),
      ),

      ///ListView.separated
      body: isLoading == false
          ? ListView.separated(
              itemCount: newsTipsModel.length,
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Divider(
                    color: AppColors.primaryColor,
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                final NewsTipsModel value = newsTipsModel[index];
                return ListTile(
                  iconColor: AppColors.primaryColor,
                  leading: Icon(Icons.notifications_active_outlined),
                  title: Text(
                    value.title!,
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 20.0),
                  ),
                  subtitle: Text(value.subTitle!),
                  trailing: IconButton(
                    onPressed: () {
                      Share.share(value.subTitle!);
                    },
                    icon: const Icon(Icons.share_outlined),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
