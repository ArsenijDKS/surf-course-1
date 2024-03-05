import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:task_9/assets/colors/appColors.dart';
import 'package:task_9/assets/res/AppAssets.dart';
import 'package:task_9/assets/strings/AppStrings.dart';
import 'package:task_9/assets/text/AppTypography.dart';

void main() {
  runApp(const BusinessCard());
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task-10 - Business Card',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        body: Center(
          child: Container(
            width: 400,
            height: 600,
            decoration: BoxDecoration(
              color: AppColors.mainCardBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color:
                      AppColors.mainCardBackgroundShadowColor.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    child: SvgPicture.asset(
                      AppAssets.atomIcon,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "lib/assets/images/me.png",
                    height: 250,
                  ),
                  const SizedBox(height: 50),
                  const Text(AppStrings.userName,
                      style: AppTypography.mainText),
                  const SizedBox(height: 10),
                  const Text(AppStrings.userSpec, style: AppTypography.subText),
                  const SizedBox(height: 10),
                  const Text(AppStrings.userPlace,
                      style: AppTypography.subText),
                  const Text(AppStrings.userExp, style: AppTypography.subText),
                  const SizedBox(height: 10),
                  const Text(AppStrings.userHobby),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
