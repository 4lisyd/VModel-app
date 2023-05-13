import 'package:badges/badges.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vmodel/src/features/dashboard/feed/controller/feed_controller.dart';
import 'package:vmodel/src/features/dashboard/feed/views/feed_explore.dart';
import 'package:vmodel/src/features/dashboard/feed/data/field_mock_data.dart';
import 'package:vmodel/src/features/dashboard/feed/widgets/user_post.dart';
import 'package:vmodel/src/features/saved/views/saved_posts_view.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';
import '../controller/feed_provider.dart';

class FeedHomeUI extends ConsumerWidget {
  final homeCtrl = Get.put<HomeController>(HomeController());
  FeedHomeUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(feedProvider);
    final fProvider = ref.watch(feedProvider.notifier);

    List postImages = [
      feedImagesList2,
      feedImagesList1,
      feedImagesList3,
      feedImagesList4,
      feedImagesList5,
      feedImagesList6,
      feedImagesList7,
      feedImagesList8,
      feedImagesList9,
      feedImagesList10,
      feedImagesList11,
      feedImagesList12,
      feedImagesList13,
      feedImagesList14,
      feedImagesList15,
      feedImagesList16,
      feedImagesList17,
      feedImagesList18,
      feedImagesList19,
      feedImagesList20,
    ];

    Future <void> reloadData() async{}

    return Scaffold(
      appBar: VWidgetsAppBar(
        appbarTitle: fProvider.isFeed ? "Feed" : "Explore",
        appBarHeight: 50,
        leadingWidth: 150,
        leadingIcon: Padding(
          padding: const EdgeInsets.only(top: 12, left: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  fProvider.isFeedPage();
                },
                child: RenderSvg(
                  svgPath: VIcons.verticalPostIcon,
                  color: fProvider.isFeed
                      ? null
                      : VmodelColors.disabledButonColor.withOpacity(0.15),
                ),
              ),

              vmSizedW(15),

              GestureDetector(
                onTap: (){
                  fProvider.isFeedPage();
                },
                child: SvgPicture.asset(VIcons.horizontalPostIcon, color: fProvider.isFeed
                    ? VmodelColors.disabledButonColor.withOpacity(0.15)
                      : null,
                ),
              ),
            ],
          ),
        ),
        trailingIcon: [

          Padding(
            padding: const EdgeInsets.only(top: 12, right: 0),
            child: SizedBox(
              height: 30,
              width: 60,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  navigateToRoute(context, const SavedView());
                },
                icon: const RenderSvg(
                  svgPath:  VIcons.unsavedPostsIcon,
                ),
              ),
            ),
          ),
        ],
      ),

      // commit

      body: SafeArea(

        child: RefreshIndicator(
          onRefresh: (){
            return reloadData();
          },
          child: Column(children: [
            (fProvider.isFeed)
                ? Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.only(bottom: 20),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => UserPost(
                              username: feedNames[index],
                              homeCtrl: homeCtrl,
                              imageList: postImages[index],
                              smallImageAsset: postImages[index][0],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 24,
                            ),
                        itemCount: postImages.length),
                  )
                : const FeedExplore(),
          ]),
        ),
      ),
    );
  }
}
