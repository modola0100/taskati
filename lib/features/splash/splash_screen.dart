import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/naviagtion.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // delay with 3 sec and navigate to home screen
    Future.delayed(Duration(seconds: 3), () {
      // navigate to home screen
      pushWithReplacement(context, const UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logoJson, width: 250),
            Gap(15),
            Text(
              'Taskati',
              style: TextStyles.titleStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(15),
            Text(
              'It\'s time to get organized',
              style: TextStyles.smallStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
