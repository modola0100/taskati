import 'dart:io';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String? userName;
  final String? userImagePath;

  const Header({Key? key, this.userName, this.userImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: userImagePath != null && userImagePath!.isNotEmpty
              ? FileImage(File(userImagePath!))
              : AssetImage('assets/images/empty_user.png') as ImageProvider,
        ),
        SizedBox(width: 16),
        Text(
          userName ?? "User Name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
