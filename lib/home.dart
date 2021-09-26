import 'package:flutter/material.dart';
import 'package:portfolio/colors.dart';
import 'package:portfolio/header.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.primaryColor,
      child: VStack([
        const HeaderScreen(),
        if (context.isMobile) const IntroductionWidget().p16(),
      ]).scrollVertical(),
    );
  }
}
