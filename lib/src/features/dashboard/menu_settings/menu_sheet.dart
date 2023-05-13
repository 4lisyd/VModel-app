import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmodel/src/core/cache/local_storage.dart';
import 'package:vmodel/src/features/archived/views/archived_view.dart';
import 'package:vmodel/src/features/authentication/views/new_login_screens/sign_in.dart';
import 'package:vmodel/src/features/booking/views/booking_sequence/booking_sequence.dart';
import 'package:vmodel/src/features/dashboard/dash/controller.dart';
import 'package:vmodel/src/features/dashboard/dash/dashboard_ui.dart';
import 'package:vmodel/src/features/dashboard/new_profile/screens/profile_base_screen.dart';
import 'package:vmodel/src/features/earnings/views/earnings_homepage.dart';
import 'package:vmodel/src/features/help_support/views/help_home.dart';
import 'package:vmodel/src/features/jobs/job_market/views/business_user/business_my_jobs.dart';
import 'package:vmodel/src/features/reviews/views/bookings_view.dart';
import 'package:vmodel/src/features/reviews/views/reviews_view.dart';
import 'package:vmodel/src/features/saved/views/saved_homepage.dart';
import 'package:vmodel/src/features/saved/views/saved_posts_view.dart';
import 'package:vmodel/src/features/settings/views/settings_page.dart';
import 'package:vmodel/src/features/tutorials/views/tutorial_home.dart';
import 'package:vmodel/src/shared/shimmer/shimmer_demo_page.dart';
import 'package:vmodel/src/vmodel.dart';
import 'package:vmodel/src/res/res.dart';

import '../../../shared/popup_dialogs/confirmation_popup.dart';

class MenuSheet extends ConsumerWidget {
  final bool isNotTabSreen;
  const MenuSheet({super.key, this.isNotTabSreen = false});

  Widget _getLeadingIcon(Widget icon) => Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      alignment: Alignment.center,
      width: 20,
      child: icon);

  Widget _customMenuTile(Widget icon, String title, Function() method,
      {String? badge}) {
    return InkWell(
      onTap: method,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                _getLeadingIcon(icon),
                vmSizedW(14),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (badge != null)
                  Container(
                    alignment: Alignment.center,
                    height: 15.sp,
                    width: 14.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: VmodelColors.error),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    ref.watch(dashTabProvider);
    final watchProvider = ref.watch(dashTabProvider.notifier);
    List menuItems = [
      _customMenuTile(_getLeadingIcon(homeIcon), 'Feed', () {
        if (isNotTabSreen == true) {
          watchProvider.changeIndexState(0);
          navigateAndRemoveUntilRoute(context, const DashBoardView());
        } else {
          Navigator.pop(context);
          watchProvider.changeIndexState(0);
        }
      }, badge: '10'),
      _customMenuTile(
          _getLeadingIcon(settingsIcon), 'Shimmer look (Temporary field)', () {
        popSheet(context);
        navigateToRoute(context, const ShimmerDemoPage());
      }),
      _customMenuTile(_getLeadingIcon(settingsIcon), 'Profile (Temporary field)', () {
        popSheet(context);
        navigateToRoute(context, ProfileBaseScreen());
      }
      

      ),
      _customMenuTile(_getLeadingIcon(settingsIcon), 'Booking Sequence', () {
        popSheet(context);
        navigateToRoute(context, const BookingSequencePage());
      }),
      _customMenuTile(_getLeadingIcon(settingsIcon), 'Settings', () {
        popSheet(context);
        navigateToRoute(context, const SettingsSheet());
      }),
      _customMenuTile(_getLeadingIcon(editIcon), 'Bookings', () {
        navigateToRoute(context, const BookingsMenuView());
      }, badge: '1'),
      _customMenuTile(
        _getLeadingIcon(budgetIcon),
        'Job Market',
        () {
          navigateToRoute(context, const BusinessMyJobsPage());
        },
      ),
      _customMenuTile(_getLeadingIcon(budgetIcon), 'Earnings', () {
        navigateToRoute(context, const EarningsPage());
      }),
      // _customMenuTile(_getLeadingIcon(userIcon), 'Edit Polaroid', () {}),
      _customMenuTile(_getLeadingIcon(savedIcon), 'Saved', () {
        navigateToRoute(context, const SavedHomePage());
      }),
      _customMenuTile(_getLeadingIcon(archivedIcon), 'Archived', () {
        navigateToRoute(context, const ArchivedView());
      }),
      // _customMenuTile(
      //   _getLeadingIcon(requestIcon),
      //   'Requests',
      //   () {},
      // ),
      _customMenuTile(_getLeadingIcon(reviewIcon), 'Reviews', () {
        navigateToRoute(context, const ReviewsUI());
      }),
      _customMenuTile(_getLeadingIcon(qrCodeIcon), 'QR code', () {
        // navigateToRoute(context, const ReviewsUI());
      }),
      _customMenuTile(_getLeadingIcon(helpIcon), 'Help and Support', () {
        navigateToRoute(context, const HelpAndSupportMainView());
      }),
      _customMenuTile(_getLeadingIcon(tutorialsIcon), 'Tutorials', () {
        navigateToRoute(context, const TutorialMainView());
      }),
      _customMenuTile(
          _getLeadingIcon(settingsIcon), 'Logout', () {
        showDialog(
            context: context,
            builder: ((context) =>  VWidgetsConfirmationPopUp(
              popupTitle: "Logout Confirmation",
              popupDescription: "Are you sure you want to logout from your account",
              onPressedYes: () async{
                Navigator.pop(context);
                await VModelSharedPrefStorage().clearObject('token');
                await VModelSharedPrefStorage().clearObject('pk');
                navigateAndRemoveUntilRoute(context, const LoginPage());
              },
              onPressedNo: () {
                Navigator.pop(context);
              },
            )));
      }),
      addVerticalSpacing(20),
    ];
    return Container(
      // margin: EdgeInsets.only(bottom: 75),
      decoration: BoxDecoration(
        color: VmodelColors.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(top: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...menuItems,
          ],
        ),
      ),
    );
  }
}
