import 'package:vmodel/src/features/dashboard/feed/controller/feed_controller.dart';
import 'package:vmodel/src/features/messages/views/messages_homepage.dart';
import 'package:vmodel/src/features/notifications/data/nav_model.dart';
import 'package:vmodel/src/features/notifications/widgets/date_text_header.dart';
import 'package:vmodel/src/features/notifications/widgets/notification_appbar_icons.dart';
import 'package:vmodel/src/features/notifications/widgets/notification_card.dart';
import 'package:vmodel/src/features/saved/views/saved_posts_view.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/appbar/appbar_title_text.dart';
import 'package:vmodel/src/vmodel.dart';

class NotificationsView extends StatelessWidget {
  final homeCtrl = Get.put<HomeController>(HomeController());
  NotificationsView({super.key});


  Future <void> reloadData() async{}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const VWidgetsAppBar(
          appBarHeight: 50,
          backgroundColor: VmodelColors.appBarBackgroundColor,
          leadingIcon: Padding(
            padding: EdgeInsets.only(top: 12),
            child: VWidgetsBackButton(),
          ),
          appbarTitle:"Notifications",
          // trailingIcon: [
          //   Padding(
          //     padding: const EdgeInsets.only(top: 12),
          //     child: VWidgetsNotificationAppbarIcons(
          //       onPressedClip: () {
          //         navigateToRoute(context, const SavedView());
          //       },
          //       onPressedSend: () {
          //         navigateToRoute(context, const MessagingHomePage());
          //       },
          //     ),
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          padding: const VWidgetsPagePadding.horizontalSymmetric(10),
          child: Column(children: [
            addVerticalSpacing(40),
            // const Padding(
            //   padding: VWidgetsPagePadding.horizontalSymmetric(5),
            //   child: VWidgetsDateHeader(
            //     date: '22/02',
            //     dateAbbrevation: 'Today',
            //   ),
            // ),
            const Padding(
              padding: VWidgetsPagePadding.horizontalSymmetric(5),
              child: VWidgetsDateHeader(
                dateAbbreviation: 'This week',
              ),
            ),

            addVerticalSpacing(8),
            ...todayMessage.map((e) {
              return VWidgetsNotificationCard(
                notificationText: e.msg.toString(),
                profileImagePath: e.picPath,
                notificationType: e.notificationType.toString(),
              );
            }),
            addVerticalSpacing(10),
            const Divider(
              color: VmodelColors.divideColor,
              height: 20,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
            ),
            addVerticalSpacing(10),
            const Padding(
              padding: VWidgetsPagePadding.horizontalSymmetric(5),
              child: VWidgetsDateHeader(
                dateAbbreviation: 'This month',
              ),
            ),
            addVerticalSpacing(8),
            ...yesterdayMessage.map((e) {
              return VWidgetsNotificationCard(
                  profileImagePath: e.picPath,
                  notificationType: e.notificationType,
                  notificationText: e.msg.toString());
            }),
            addVerticalSpacing(10),
            // const Divider(
            //   color: VmodelColors.divideColor,
            //   height: 1,
            //   thickness: 0.5,
            //   indent: 0,
            //   endIndent: 0,
            // ),
            // addVerticalSpacing(40),
          ]),
        ));
  }
}
