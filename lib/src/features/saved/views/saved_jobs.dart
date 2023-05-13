
import 'package:vmodel/src/features/dashboard/feed/widgets/share.dart';
import 'package:vmodel/src/features/jobs/job_market/widget/business_user/business_my_jobs_card.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class SavedJobsHomepage extends StatelessWidget {
  const SavedJobsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon:  VWidgetsBackButton(),
        appbarTitle: "Saved Jobs",
       
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(8),
        child: Column(children: [
          addVerticalSpacing(20),
         VWidgetsBusinessMyJobsCard(
            profileImage: VmodelAssets2.imageContainer,
            profileName: "Tilly's Bakery Services",
            jobDescription:
                "Hello, We’re looking for models, influencers and photographers to assist us with our end of the year shoot. We want 2 male models,",
            location: "London",
            time: "3:30 hr",
            appliedCandidateCount: "16",
            jobBudget: "450",
            candidateType: "Female",
            shareJobOnPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                useRootNavigator: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => const ShareWidget(
                  shareLabel: 'Share Job',
                  shareTitle: "Tilly's Bakery services",
                  shareImage: VmodelAssets2.imageContainer,
                  shareURL: "Vmodel.app/job/tilly's-bakery-services",
                ),
              );
            },

          ),
          VWidgetsBusinessMyJobsCard(
            profileImage: VmodelAssets2.imageContainer,
            profileName: "Tilly's Bakery Services",
            jobDescription:
                "Hello, We’re looking for models, influencers and photographers to assist us with our end of the year shoot. We want 2 male models",
            location: "London",
            time: "3:30 hr",
            appliedCandidateCount: "16",
            jobBudget: "450",
            candidateType: "Female",
            shareJobOnPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                useRootNavigator: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => const ShareWidget(
                  shareLabel: 'Share Job',
                  shareTitle: "Tilly's Bakery services",
                  shareImage: VmodelAssets2.imageContainer,
                  shareURL: "Vmodel.app/job/tilly's-bakery-services",
                ),
              );
            },

          ),
        ]),
      ),
    );
  }
}