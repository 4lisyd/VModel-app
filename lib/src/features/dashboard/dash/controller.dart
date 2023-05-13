import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmodel/src/core/routing/navigator_1.0.dart';
import 'package:vmodel/src/core/utils/enum/profile_types.dart';
import 'package:vmodel/src/features/create_posts/views/create_post.dart';
import 'package:vmodel/src/features/dashboard/content/views/content_main_screen.dart';
import 'package:vmodel/src/features/dashboard/discover/views/discover_main_screen.dart';
import 'package:vmodel/src/features/dashboard/feed/views/feed_home.dart';
import 'package:vmodel/src/features/dashboard/profile/view/profile_main_view.dart';
import 'package:vmodel/src/features/jobs/create_jobs/views/create_job_view_first.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';

final dashTabProvider = StateNotifierProvider((ref) {
  return DashTabProvider();
});

class DashTabProvider extends StateNotifier<int> {
  // For users logging into the app for the first time
  DashTabProvider() : super(1);

  // for normal users
  // DashTabProvider() : super(0);

  void increment() => state++;
  int get tabIndex => state;
  int get getPageIndex => state;
  void changeIndexState(int index) {
    state = index;
  }

  Widget returnSelected(BuildContext context) {
    return pages(context)[state];
  }

  bool activeCameraIcon = false;
  Color backgroundColor = Colors.white;
  Color iconColor = VmodelColors.primaryColor;
  colorsChangeBackGround(int index) {
    if (state == 2) {
      backgroundColor = VmodelColors.blackColor;
      activeCameraIcon = true;
      iconColor = VmodelColors.white;
    } else {
      backgroundColor = Colors.white;
      activeCameraIcon = false;
      iconColor = VmodelColors.primaryColor;
    }
  }

  List<Widget> pages(BuildContext context) {
    return [
      FeedHomeUI(),
      const DiscoverView(),
      const ContentView(),
      const ProfileMainView(
        profileTypeEnumConstructor: ProfileTypeEnum.personal,
      ),
    ];
  }

  returnContentIcon(
      {Widget? contentWidget,
      Widget? defaultIcon,
      int? index,
      Widget? indexRender}) {
    return state == 2
        ? contentWidget
        : state == index
            ? indexRender
            : defaultIcon;
  }


  List<UploadOptions> createOptions(BuildContext context) {
    return [
      UploadOptions(
          label: "Create a post",
          onTap: () {
            popSheet(context);
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ..._uploadOptions(context).map((e) {
                      return Container(
                        decoration: BoxDecoration(
                          color: VmodelColors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 4),
                        height: 50,
                        child: MaterialButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          onPressed: e.onTap,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.label.toString(),
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
      UploadOptions(
          label: "Create a job",
          onTap: () {
            navigateToRoute(context, const CreateJobFirstPage());
          }),
    ];
  }

  List<UploadOptions> _uploadOptions(BuildContext context) => [
        UploadOptions(
            label: "Photo",
            onTap: () {
              popSheet(context);
              navigateToRoute(context, const CreatePostPage());
            }),
        UploadOptions(
            label: "Video",
            onTap: () {
              popSheet(context);
              navigateToRoute(context, const CreatePostPage());
            }),
        UploadOptions(
            label: "Album",
            onTap: () {
              popSheet(context);
              navigateToRoute(context, const CreatePostPage());
            }),
        UploadOptions(
            label: "Polaroid",
            onTap: () {
              popSheet(context);
              navigateToRoute(context, const CreatePostPage());
            }),
      ];

  List<Widget> bottomNavItems(BuildContext context, Function() onFeedTap) {
    return [
      IconButton(
        splashColor: Colors.transparent,
        onPressed: () {
          changeIndexState(0);
          colorsChangeBackGround(0);
          onFeedTap();
        },
        iconSize: 28,
        icon: returnContentIcon(
          contentWidget: RenderSvgWithoutColor(
            svgPath: VIcons.contentHome,
            svgHeight: activeHeight(0),
            svgWidth: activeWidth(0),
          ),
          defaultIcon: RenderSvg(
            svgPath: VIcons.normalHomeIcon,
            svgHeight: activeHeight(0),
            color: iconColor,
            svgWidth: activeWidth(0),
          ),
          index: 0,
          indexRender: RenderSvg(
            svgPath: VIcons.selectedHomeIcon,
            svgHeight: activeHeight(0),
            color: iconColor,
            svgWidth: activeWidth(0),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          changeIndexState(1);
          colorsChangeBackGround(1);
        },
        iconSize: 28,
        icon: returnContentIcon(
          contentWidget: RenderSvgWithoutColor(
            svgPath: VIcons.contentDiscoverIcon,
            svgHeight: activeHeight(0),
            svgWidth: activeWidth(0),
          ),
          defaultIcon: RenderSvg(
            svgPath: VIcons.contentDiscoverIcon,
            svgHeight: activeHeight(0),
            svgWidth: activeWidth(0),
          ),
          index: 1,
          indexRender: RenderSvgWithoutColor(
            svgPath: VIcons.selectedDiscover,
            svgHeight: activeHeight(0),
            svgWidth: activeWidth(0),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.only(bottom: 90.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...createOptions(context).map((e) {
                    return Container(
                      decoration: BoxDecoration(
                        color: VmodelColors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 4),
                      height: 50,
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        onPressed: e.onTap,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.label.toString(),
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
        child: returnContentIcon(
          contentWidget: const RenderSvgWithoutColor(
            svgPath: VIcons.vModelLogoDarkMode,
            svgHeight: 50,
            svgWidth: 35,
          ),
          defaultIcon: const RenderSvgWithoutColor(
            svgPath: VIcons.vLogoIconLightMode,
            svgHeight: 50,
            // color: iconColor,
            svgWidth: 35,
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          changeIndexState(2);
          colorsChangeBackGround(2);
        },
        iconSize: 30,
        icon: returnContentIcon(
          contentWidget: RenderSvg(
            svgPath: VIcons.normalContent,
            // svgHeight: activeHeight(2, definedHeight: 30),
            color: VmodelColors.white,
            // svgWidth: activeWidth(2, definedWidth: 15),
          ),
          index: 2,
          defaultIcon: NormalRenderSvgWithColor(
            svgPath: VIcons.normalContent,
            // svgHeight: activeHeight(2, definedHeight: 30),
            color: iconColor,
            // svgWidth: activeWidth(2, definedWidth: 15),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          changeIndexState(3);
          colorsChangeBackGround(3);
        },
        iconSize: 30,
        icon: returnContentIcon(
          contentWidget: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage(VIcons.profileLightModeicon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          index: 4,
          defaultIcon: Image.asset(
            VIcons.profileLightModeicon,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            // height: activeHeight(4),
          ),
        ),
      ),
    ];
  }

  double activeWidth(int index, {double? definedWidth}) {
    return state == index ? definedWidth ?? 18 : definedWidth ?? 18;
  }

  double activeHeight(int index, {double? definedHeight}) {
    return state == index ? definedHeight ?? 24 : definedHeight ?? 24;
  }
}

class UploadOptions {
  String? label;
  Function()? onTap;
  UploadOptions({this.label, this.onTap});
}
