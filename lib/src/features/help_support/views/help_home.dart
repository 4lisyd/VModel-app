import 'package:vmodel/src/features/help_support/models/help_mock.dart';
import 'package:vmodel/src/features/help_support/views/help_details.dart';
import 'package:vmodel/src/features/help_support/widgets/help_tile.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class HelpAndSupportMainView extends StatelessWidget {
  const HelpAndSupportMainView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon: Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        appBarHeight: 50,
        appbarTitle: "Help and support",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const VWidgetsPagePadding.horizontalSymmetric(18),
          padding: const VWidgetsPagePadding.verticalSymmetric(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular FAQs",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Theme.of(context).primaryColor),
              ),
              addVerticalSpacing(10),
              for (int i = 0; i < HelpSupportModel.popularFAQS().length; i++)
                VWigetsHelpTile(
                  titleTitle:
                      HelpSupportModel.popularFAQS()[i].title.toString(),
                  onTap: () {
                    navigateToRoute(
                        context,
                        HelpDetailsView(
                          helpDetailsTitle: HelpSupportModel.popularFAQS()[i]
                              .title
                              .toString(),
                        ));
                  },
                  iconPath: '',
                ),
              addVerticalSpacing(50),
              Text(
                "FAQs Topics",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
              addVerticalSpacing(10),
              for (int i = 0; i < HelpSupportModel.faqTopics().length; i++)
                VWigetsHelpTile(
                  titleTitle: HelpSupportModel.faqTopics()[i].title.toString(),
                  shouldHaveIcon: true,
                  onTap: () {
                    navigateToRoute(
                        context,
                        HelpDetailsView(
                          helpDetailsTitle:
                              HelpSupportModel.faqTopics()[i].title.toString(),
                        ));
                  },
                  iconPath: HelpSupportModel.faqTopics()[i].iconPath.toString(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
