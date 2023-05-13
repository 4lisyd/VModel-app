import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmodel/src/features/dashboard/dash/controller.dart';
import 'package:vmodel/src/features/dashboard/feed/controller/feed_provider.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class DashBoardView extends ConsumerWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    ref.watch(dashTabProvider);
    final watchProvider = ref.watch(dashTabProvider.notifier);
    ref.watch(feedProvider);
    final fProvider = ref.watch(feedProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,

    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: watchProvider.returnSelected(context),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // spreadRadius: 0,
              // blurRadius: 0.5,
              color: watchProvider.getPageIndex != 2
                  ? VmodelColors.appBarShadowColor
                  : VmodelColors.black,
              // offset: const Offset(0, -1), // changes position of shadow
            ),
          ],
          color: watchProvider.backgroundColor,
        ),
        height: 79,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: watchProvider.bottomNavItems(context, () {
              fProvider.isFeedPage(isFeedOnly: false);
            }),
          ),
        ),
      ),
    );
  }
}
