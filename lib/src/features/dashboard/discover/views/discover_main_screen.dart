import 'package:vmodel/src/features/dashboard/discover/map/map-search_screen.dart';
import 'package:vmodel/src/features/dashboard/discover/models/discover_page_mock_data.dart';
import 'package:vmodel/src/features/dashboard/discover/views/discover_filter.dart';
import 'package:vmodel/src/features/dashboard/discover/views/discover_user_search.dart/views/dis_search_main_screen.dart';
import 'package:vmodel/src/features/dashboard/discover/views/sub_screens/view_all.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/category_button.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/discover_sub_list.dart';
import 'package:vmodel/src/features/jobs/job_market/views/job_market_homepage.dart';
// import 'package:vmodel/src/features/vmagazine/views/vMagzine_view.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';
import '../../../jobs/job_market/views/business_user/business_my_jobs.dart';
import '../../../vmagazine/views/vmagzine_view.dart';


class DiscoverView extends StatefulWidget {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  String selectedChip = "Models";

  Future<void> reloadData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        appbarTitle: "Discover",
        appBarHeight: 50,
        // leadingIcon: Padding(
        //   padding: const EdgeInsets.only(top: 12, left: 15),
        //   child: Flexible(
        //     child: IconButton(
        //       padding: const EdgeInsets.all(0),
        //       onPressed: () {
        //         navigateToRoute(context, const VMagazineView());
        //       },
        //       icon: const RenderSvg(
        //         svgPath: VIcons.vMagaZineIcon,
        //       ),
        //     ),
        //   ),
        // ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 0),
            child: SizedBox(
              height: 30,
              width: 100,
              child: Row(
                children: [
                  Flexible(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        navigateToRoute(context, const BusinessMyJobsPage());
                      },
                      icon: const RenderSvg(
                        svgPath: VIcons.jobMarketIcon,
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        // navigateToRoute(context, const DiscoverFilter());
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => DraggableScrollableSheet(
                            expand: false,
                            key: UniqueKey(),
                            initialChildSize: 0.9,
                            maxChildSize: 0.9,
                            minChildSize: .5,
                            builder: (context, controller) =>
                                const DiscoverFilter(),
                          ),
                        );
                      },
                      icon: const RenderSvg(
                        svgPath: VIcons.setting,
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
      body: RefreshIndicator(
        onRefresh: () {
          return reloadData();
        },
        child: const DiscoverDummyList(),
      ),
    );
  }
  // Widget _showModalBottomSheet() => DraggableScrollableSheet(
  //   expand: false,
  //   key: UniqueKey(),
  //   initialChildSize: 0.9,
  //   maxChildSize: 0.9,
  //   minChildSize: .5,
  //   builder: (context, controller) => const DiscoverFilter(),
  // );
}
