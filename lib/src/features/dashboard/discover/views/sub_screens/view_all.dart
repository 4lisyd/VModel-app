import 'package:flutter/material.dart';
import 'package:vmodel/src/core/routing/navigator_1.0.dart';
import 'package:vmodel/src/features/dashboard/discover/tapandhold/tap_and_hold.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/discover_sub_item.dart';
import 'package:vmodel/src/features/notifications/views/notifications_ui.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';

const mockData = [
  'assets/images/models/model_2.png',
  'assets/images/models/model_4.png',
  'assets/images/models/model_5.png',
  'assets/images/models/model_6.png',
  'assets/images/models/model_4.png',
  'assets/images/models/model_1.png',
  'assets/images/models/model_2.png',
  'assets/images/models/model_5.png',
];

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key, required this.title, required this.dataList})
      : super(key: key);
  final String title;
  final List dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: VWidgetsBackButton(),
        ),
        backgroundColor: Colors.white,
        appbarTitle: title,
        trailingIcon: [
          SizedBox(
            height: 30,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  // Flexible(
                  //   child: IconButton(
                  //     padding: const EdgeInsets.all(0),
                  //     onPressed: () {
                  //       navigateToRoute(context, const MessagingHomePage());
                  //     },
                  //     icon: const RenderSvg(
                  //       svgPath: VIcons.sendWitoutNot,
                  //       svgHeight: 24,
                  //       svgWidth: 24,
                  //     ),
                  //   ),
                  // ),
                  Flexible(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        navigateToRoute(context, NotificationsView());
                      },
                      icon: const RenderSvg(
                        svgPath: VIcons.notificationIcon,
                        svgHeight: 24,
                        svgWidth: 24,
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        openVModelMenu(context, isNotTabScreen: true);
                      },
                      icon: const NormalRenderSvg(
                        svgPath: VIcons.circleIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          addVerticalSpacing(2),
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.7),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DiscoverSubItem(
                      isViewAll: true,
                      onTap: () {},
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return TapAndHold(item: dataList[index]);
                            });
                      },
                      item: dataList[index],
                    );
                  })),
          vmSizedH(10),
        ],
      ),
    );
  }
}
