import 'package:badges/badges.dart' as notiBadge;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vmodel/src/features/dashboard/feed/controller/feed_controller.dart';
import 'package:vmodel/src/features/dashboard/feed/data/field_mock_data.dart';
import 'package:vmodel/src/features/dashboard/feed/widgets/user_post.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class ProfileFeedView extends ConsumerWidget {
  final homeCtrl = Get.put<HomeController>(HomeController());
  final List images;
  ProfileFeedView({
    required this.images,
    Key? key,
  }) : super(key: key);

  Future<void> reloadData() async {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        appbarTitle: "Feed",
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 8),
            child: SizedBox(
              height: 30,
              width: 100,
              child: Row(
                children: [
                  Flexible(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: const RenderSvg(
                        svgPath: VIcons.unsavedPostsIcon,
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      padding: const EdgeInsets.only(top: 2),
                      onPressed: () {},
                      icon: notiBadge.Badge(
                        alignment: Alignment.topRight,
                        badgeColor: VmodelColors.bottomNavIndicatiorColor,
                        elevation: 0,
                        toAnimate: true,
                        showBadge: true,
                        badgeContent: Text(
                          '3',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: VmodelColors.white),
                        ),
                        child: SvgPicture.asset(
                          VIcons.sendWitoutNot,
                          width: 230,
                          height: 23,
                        ),
                      ),
                    ),
                  ),
                  addHorizontalSpacing(5),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return reloadData();
          },
          child: Column(children: [
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 20),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => UserPost(
                        username: feedNames[index],
                        homeCtrl: homeCtrl,
                        imageList: [images[index]],
                        smallImageAsset: images[index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 24,
                      ),
                  itemCount: images.length),
            ),
          ]),
        ),
      ),
    );
  }
}
