import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/profile/profile_screen.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    final nameRaw = LocalHelper.getData(LocalHelper.kName);
    final imageRaw = LocalHelper.getData(LocalHelper.kImage);

    final String displayName = (nameRaw is String && nameRaw.isNotEmpty)
        ? nameRaw.split(' ').first
        : 'Guest';

    final ImageProvider avatarImage =
        (imageRaw is String && imageRaw.isNotEmpty)
        ? FileImage(File(imageRaw))
        : const AssetImage('assets/images/user.png');

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $displayName',
                style: TextStyles.getTitle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('Have a Nice Day', style: TextStyles.getBody()),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            pushTo(
              context,
              const ProfileScreen(),
            ).then((value) => setState(() {}));
          },
          child: CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(radius: 22, backgroundImage: avatarImage),
          ),
        ),
      ],
    );
  }
}
// ...existing code...ر