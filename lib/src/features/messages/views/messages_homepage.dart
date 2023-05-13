import 'package:flutter/cupertino.dart';
import 'package:vmodel/src/features/dashboard/discover/models/mock_data.dart';
import 'package:vmodel/src/features/messages/views/create_offer.dart';
import 'package:vmodel/src/features/messages/views/messages_chat_screen.dart';
import 'package:vmodel/src/features/messages/widgets/message_homepage_card.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/res/typography/textstyle.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/category_chips/category_button.dart';
import 'package:vmodel/src/shared/cupertino_modal_pop_up/cupertino_action_sheet.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/shared/text_fields/initial_text_field.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class MessagingHomePage extends StatefulWidget {
  const MessagingHomePage({super.key});

  @override
  State<MessagingHomePage> createState() => _MessagingHomePageState();
}

class _MessagingHomePageState extends State<MessagingHomePage> {
  String selectedChip = "Model";
  bool isLiked = false;
  bool isLikedTemp = false;

  Future<void> reloadData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        backgroundColor: VmodelColors.white,
        appbarTitle: "Messages",
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        trailingIcon: [
          IconButton(
              padding: const EdgeInsets.only(top: 12),
              onPressed: () {
                openVModelMenu(context, isNotTabScreen: true);
              },
              icon: circleIcon),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return reloadData();
        },
        child: ListView(
          padding: const VWidgetsPagePadding.horizontalSymmetric(18),
          children: [
            VWidgetsPrimaryTextFieldWithTitle(
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const RenderSvgWithoutColor(
                    svgPath: VIcons.searchNormal,
                    svgHeight: 20,
                    svgWidth: 20,
                  ),
                )),
            //as text field takes padding 4 and in figma padding is 17 that's why 17-4 =13 padding
            addVerticalSpacing(13),
            //category chips
            SizedBox(
              height: 54,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return VWidgetsCategoryButton(
                    isSelected: selectedChip == categories[index],
                    text: categories[index],
                    onPressed: () =>
                        setState(() => selectedChip = categories[index]),
                  );
                },
              ),
            ),
            addVerticalSpacing(5),
            //messages
            VWidgetsMessageCard(
              profileImage: 'assets/images/jobs_market_images/img.png',
              titleText: "Georgina Powell",
              latestMessage: "Sounds good!",
              starRating: "4",
              latestMessageTime: "5m",
              isLiked: isLiked,
              onTapCard: () {
                navigateToRoute(context, const MessagesChatScreen());
              },
              onPressedLike: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
            VWidgetsMessageCard(
              profileImage: 'assets/images/jobs_market_images/img.png',
              titleText: "Georgina Powell",
              latestMessage: "Sound good!",
              starRating: "4",
              latestMessageTime: "5m",
              isLiked: isLikedTemp,
              onTapCard: () {
                navigateToRoute(context, const MessagesChatScreen());
              },
              onPressedLike: () {
                setState(() {
                  isLikedTemp = !isLikedTemp;
                });
              },
            ),
          ],
        ),
      ),
    );
  }


}
