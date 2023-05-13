import 'package:flutter/material.dart';
import 'package:vmodel/src/features/dashboard/profile/widget/user_profile/expanded_bio_card.dart';

class ProfileExpandedBio extends StatelessWidget {
  final String imgLink;
  final VoidCallback onPortfolioCheck;
  final String mainBio;
  const ProfileExpandedBio(
      {super.key,
      required this.imgLink,
      required this.onPortfolioCheck,
      required this.mainBio});

  @override
  Widget build(BuildContext context) {
    return VWidgetsProfileBio(
      imgLink: imgLink,
      mainBioInfo: mainBio,
      extendedbioInfo:
          'Hi, I’m a model with ABC Model Agency in San Francisco, CA who is interested in building a good portfolio for my model work.I’m originally from portugal. I moved to. the UK when I was 15, This is hen I started modeling.\nI’m very down to earth and I likehaving fun on shoots. I’m never shy to go behind the camera and you can always count on me to always be professional.',
      onPressedIcon: () {
        onPortfolioCheck();
      },
      key: null,
    );
  }
}
