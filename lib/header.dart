import 'package:flutter/material.dart';
import 'package:portfolio/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:antdesign_icons/antdesign_icons.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      if (context.isMobile) 50.heightBox else 10.heightBox,
      const CustomAppBar().shimmer(primaryColor: MyColors.accentColor),
      30.heightBox,
      'Sangam\nSingh'
          .text
          .white
          .xl6
          .lineHeight(1)
          .bold
          .size(context.isMobile ? 15 : 20)
          .make()
          .shimmer(),
      20.heightBox,
      VxBox()
          .color(MyColors.accentColor)
          .size(80, 10)
          .make()
          .shimmer(primaryColor: MyColors.accentColor),
      30.heightBox,
      const SocialAccounts(),
    ];
    return SafeArea(
        child: VxBox(
                child: VStack([
      ZStack([
        const PictureWidget(),
        Row(
          children: [
            VStack(children2).pSymmetric(h: context.percentWidth * 10, v: 32),
            Expanded(
                child: VxResponsive(
              fallback: const Offstage(),
              medium: const IntroductionWidget()
                  .pOnly(left: 120)
                  .h(context.percentHeight * 60),
              large: const IntroductionWidget()
                  .pOnly(left: 120)
                  .h(context.percentHeight * 60),
            ))
          ],
        ).w(context.screenWidth),
      ]),
    ]))
            .size(context.screenWidth, context.percentHeight * 60)
            .color(MyColors.secondaryColor)
            .make());
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          ' - Introduction'.text.gray500.widest.sm.make(),
          '@Flutter & Full Stack Developer and Freelancer'
              .text
              .white
              .xl2
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              launch('https://codersangam.com');
            },
            child: 'Visit codersangam.com'.text.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyColors.accentColor)),
          ),
        ),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Transform(
        transform: Matrix4.rotationY(0),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 170),
          child: Image.asset(
            'assets/images/3.png',
            fit: BoxFit.cover,
            height: context.percentHeight * 60,
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      AntIcons.codeFilled,
      size: 60,
      color: MyColors.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        const Icon(AntIcons.githubFilled, color: Colors.white).mdClick(() {
          launch('https://github.com/codersangam');
        }).make(),
        20.widthBox,
        const Icon(AntIcons.facebookOutlined, color: Colors.white).mdClick(() {
          launch('https://www.facebook.com/profile.php?id=100026804131628');
        }).make(),
        20.widthBox,
        const Icon(AntIcons.instagramFilled, color: Colors.white).mdClick(() {
          launch('https://instagram.com/codersangam');
        }).make(),
        20.widthBox,
        const Icon(AntIcons.linkedinOutlined, color: Colors.white).mdClick(() {
          launch('https://www.linkedin.com/in/sangam-singh-1b21941a0/');
        }).make(),
        20.widthBox,
      ],
    );
  }
}
