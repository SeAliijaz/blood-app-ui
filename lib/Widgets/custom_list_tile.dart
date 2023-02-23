import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final VoidCallback? onTap;

  const CustomListTile({
    this.title,
    this.leading,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          textColor: Colors.black,
          iconColor: Colors.black,
          tileColor: Colors.white,
          leading: leading,
          title: Text(title ?? "title"),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Divider(),
      ],
    );
  }
}
