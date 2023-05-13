
import 'package:vmodel/src/features/saved/views/saved_jobs.dart';
import 'package:vmodel/src/features/saved/views/saved_posts_view.dart';
import 'package:vmodel/src/features/saved/widgets/saved_homepage_category_card.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class SavedHomePage extends StatelessWidget {
  const SavedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon:  VWidgetsBackButton(),
        appbarTitle: "Saved",
       
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: Column(children: [
          addVerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VWidgetsSavedHomepageCategoryCard(
                categoryImage: VmodelAssets2.imageContainer,
                categoryName: "All Posts",
                onTap: () {
                  navigateToRoute(context, const SavedView());
                },
              ),
              VWidgetsSavedHomepageCategoryCard(
                categoryImage: VmodelAssets2.imageContainer,
                categoryName: "Jobs",
                onTap: () {
                  navigateToRoute(context, const SavedJobsHomepage());
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
