import 'package:flutter/material.dart';
import 'package:vmodel/src/core/utils/browser_laucher.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/features/dashboard/new_profile/widgets/profile_subinfo_widget.dart';
import 'package:vmodel/src/features/dashboard/new_profile/widgets/profile_widget.dart';
import 'package:vmodel/src/features/dashboard/profile/widget/user_profile/profile_buttons_widget.dart';

import 'package:vmodel/src/res/res.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: Colors.white),
    child: Padding(
      padding: const VWidgetsPagePadding.horizontalSymmetric(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpacing(20),
          const VWidgetsProfileCard(
            profileImage: 'assets/images/portfolio_images/f3.jpeg', 
            mainBio: "Hi, I’m a model with ABC Model Agency in San Francisco, CA who is interested in building a good portfolio for my model work",
            ),
          addVerticalSpacing(12),

          /// For Sub info of profile
          VWidgetsProfileSubInfoDetails(
            stars: "4.9",
            //profileTypeEnum: widget.profileTypeEnum,
            address: "Los Angeles, USA",
            companyUrl: "www.afrogarm.com",
            budget: "450",
            onPressedCompanyURL: () {
              VUtilsBrowserLaucher.lauchWebBrowserWithUrl("www.afrogarm.com");
            },
            userName: 'Samantha Colins',
          ),

          addVerticalSpacing(12),

          VWidgetsProfileButtons(
            largeButtonTitle: "Bookings",
            connectTitle: "Network",
            connectOnPressed: () {},
            smallButtonOneTitle: 'Polaroid',
            smallButtonTwoTitle: "Messages",
            polaroidOrTopPicksOnPressed: () {},
            messagesOnPressed: () {},
            instagramOnPressed: () {},
            instaLineOnPressed: () {},
            bookNowOnPressed: () {},
            connected: true,
          ),

          addVerticalSpacing(5),
        ],
      ),
    ),
  );
}
