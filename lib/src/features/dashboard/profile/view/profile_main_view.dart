import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmodel/src/core/api/graphql_service.dart';
import 'package:vmodel/src/core/cache/local_storage.dart';
import 'package:vmodel/src/core/utils/enum/profile_types.dart';
import 'package:vmodel/src/features/dashboard/polaroid/data/polarid_mock_data.dart';
import 'package:vmodel/src/features/dashboard/profile/view/general_profile_specifics.dart';
import 'package:vmodel/src/features/dashboard/profile/widget/user_profile/profile_tab_widget.dart';
import 'package:vmodel/src/features/notifications/views/notifications_ui.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class ProfileMainView extends ConsumerStatefulWidget {
  final ProfileTypeEnum profileTypeEnumConstructor;
  final bool shouldHaveBackButton;

  const ProfileMainView(
      {Key? key,
      this.shouldHaveBackButton = true,
      required this.profileTypeEnumConstructor})
      : super(key: key);

  @override
  ConsumerState<ProfileMainView> createState() => _ProfileMainViewState();
}


class _ProfileMainViewState extends ConsumerState<ProfileMainView>
    with SingleTickerProviderStateMixin {
  late TabController tabBarController;
  // GraphQlService _graphQlService = GraphQlService();

  int _pk = 0;
  late Future user;

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pk = (prefs.getInt('pk') ?? 0);
      print(_pk);
    });
  }

  final double _animatedHeight = 600.0;
  bool isDefaultBio = true;

  @override
  void initState() {

    _loadCounter();
    user = ref.read(authProvider.notifier).getUser(_pk != 0 ? _pk : ref.read(authProvider.notifier).state.pk!.toInt() );

    tabBarController =
        TabController(length: mockCategories.length, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen for changes to the route.
    final route = ModalRoute.of(context);
    if (route != null) {
      // Update the future when the route changes.
      // route.didPush();
      user = ref.read(authProvider.notifier).getUser(_pk != 0 ? _pk : ref.read(authProvider.notifier).state.pk!.toInt() );
    }
  }


  @override
  Widget build(BuildContext context) {
    // final authNotifier = ref.read(authProvider.notifier);
    // final pk = VModelSharedPrefStorage().getInt('pk');
    TextTheme theme = Theme.of(context).textTheme;
    return FutureBuilder(
      future: user,
      builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }else if (snapshot.hasError) {
      return Center(
        child: Text('Error: ${snapshot.error}'),
      );
    }else{
      final user = snapshot.data;
        return DefaultTabController(
            length: mockCategories.length,
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle:
                          NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      sliver: SliverAppBar(

                        automaticallyImplyLeading: widget.shouldHaveBackButton,
                        leading: (widget.shouldHaveBackButton == true)
                            ? const Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: VWidgetsBackButton(),
                              )
                            : const Text(""),
                        titleTextStyle: theme.displayLarge?.copyWith(
                          color: VmodelColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  ref.read(authProvider.notifier).state.username.toString(),
                                  // widget.profileTypeEnumConstructor ==
                                  //         ProfileTypeEnum.business
                                  //     ? "Afrogarm"
                                  //     : 'Samantha',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              addHorizontalSpacing(5),
                              verifiedBadge
                            ],
                          ),
                        ),
                        centerTitle: true,
                        shadowColor: Colors.grey[350],
                        backgroundColor: Colors.white,
                        flexibleSpace:
                            returnBasedOnUser(widget.profileTypeEnumConstructor),
                       forceElevated: innerBoxIsScrolled,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 30,
                              width: 80,
                              child: Row(
                                children: [
                                  // Flexible(
                                  //   child: IconButton(
                                  //     padding: const EdgeInsets.all(0),
                                  //     onPressed: () {
                                  //       navigateToRoute(
                                  //           context, const MessagingHomePage());
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
                                      onPressed: () async{
                                        // final token = await VModelSharedPrefStorage().getString('token');
                                        // print(token);
                                        // final authNotifier = ref.read(authProvider.notifier);
                                        // await authNotifier.getUser(authNotifier.state.pk!.toInt());
                                        // await _graphQlService.getUser();
                                        navigateToRoute(
                                            context, NotificationsView());
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
                                        openVModelMenu(context);
                                      },
                                      icon: const NormalRenderSvg(
                                        svgPath: VIcons.circleIcon,
                                      ),
                                    ),
                                  ),
                                  addHorizontalSpacing(5),
                                ],
                              ),
                            ),
                          ),
                        ],
                        expandedHeight: 59.h,
                        pinned: true,
                        elevation: 1,
                        bottom: TabBar(
                          labelStyle: theme.displayMedium?.copyWith(
                              fontWeight: FontWeight.w600),
                          labelColor: VmodelColors.primaryColor,
                          unselectedLabelColor: VmodelColors.unselectedText,
                          unselectedLabelStyle: theme.displayMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                          indicatorColor: VmodelColors.mainColor,
                          isScrollable: true,
                          tabs: mockCategories
                              .map((e) => Tab(
                                    text: e,
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  ];
                },

                body: const TabBarView(
                    children: [
                  ProfileTabWidget(
                    name: "Features",
                    images: featuresMockData,
                  ),
                  ProfileTabWidget(
                    name: "Favourites",
                    images: featuresMockData,
                  ),
                  ProfileTabWidget(
                    name: "Commercial",
                    images: commercialMockData,
                  ),
                  ProfileTabWidget(
                    name: "Editorial",
                    images: featuresMockData,
                  ),
                  ProfileTabWidget(name: "Underwear", images: underwearMockData),
                ]
                    // mockCategories.map((e) => Polaroid1(name: e)).toList()
                    ),
              ),
            ));
      }}
    );
  }
}

const mockCategories = [
  'Features',
  'Favourites',
  'Commercial',
  'Editorial',
  'Underwear'
];

Widget returnBasedOnUser(ProfileTypeEnum profileTypeEnumSelection) {
  if (profileTypeEnumSelection == ProfileTypeEnum.business) {
    return const GeneralProfileSpecifics(
      imgLink: 'assets/images/business/business_profile_picture.png',
      profileTypeEnum: ProfileTypeEnum.business,
      isMainPortfolio: true,
    );
  } else if (profileTypeEnumSelection == ProfileTypeEnum.photographer) {
    return const GeneralProfileSpecifics(
      imgLink: 'assets/images/models/model_11.png',
      isMainPortfolio: true,
      profileTypeEnum: ProfileTypeEnum.photographer,
    );
  } else {
    return const GeneralProfileSpecifics(
      imgLink: 'assets/images/models/model_11.png',
      isMainPortfolio: true,
      profileTypeEnum: ProfileTypeEnum.personal,
    );
  }
}
