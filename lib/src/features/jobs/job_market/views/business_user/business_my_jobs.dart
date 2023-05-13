import 'package:vmodel/src/features/dashboard/feed/widgets/share.dart';
import 'package:vmodel/src/features/dashboard/menu_settings/menu_sheet.dart';
import 'package:vmodel/src/features/jobs/job_market/widget/business_user/business_my_jobs_card.dart';
import 'package:vmodel/src/res/assets/app_asset.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/text_fields/dropdown_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class BusinessMyJobsPage extends StatefulWidget {
  const BusinessMyJobsPage({super.key});

  @override
  State<BusinessMyJobsPage> createState() => _BusinessMyJobsPageState();
}

class _BusinessMyJobsPageState extends State<BusinessMyJobsPage> {
    String selectedVal1 = "Photographers";
  String selectedVal2 = "Models";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle: "Job Market",
        trailingIcon: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  useRootNavigator: true,
                  context: context,
                  isScrollControlled: true,
                  enableDrag: true,
                  anchorPoint: const Offset(0, 200),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: ((context) => const MenuSheet()),
                );
              },
              icon: circleIcon),
        ],
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(8),
        child: Column(children: [
          addVerticalSpacing(25),
              Padding(
                padding: const VWidgetsPagePadding.horizontalSymmetric(5),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      VWidgetsDropDownTextField<String>(
                        havePrefix: true,
                        onChanged: (selected) {
                          setState(() {
                            selectedVal1 = selected;
                          });
                        },
                        value: selectedVal1,
                        hintText: "",
                        options: const ["Photographers", "Models"],
                        prefixText: "Jobs  ",
                        getLabel: (String value) => selectedVal1,
                      ),
                      addHorizontalSpacing(8),
                      VWidgetsDropDownTextField<String>(
                        havePrefix: true,
                        onChanged: (selected) {
                          setState(() {
                            selectedVal2 = selected;
                          });
                        },
                        value: selectedVal2,
                        hintText: "",
                        options: const ["Photographers", "Models"],
                           prefixText: "Job Types  ",
                        getLabel: (String value) => selectedVal2,
                      ),
                    ],
                  ),
                ),
              ),
          addVerticalSpacing(5),
          
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
          
          VWidgetsBusinessMyJobsCard(
            profileImage: VmodelAssets2.imageContainer,
            profileName: "Tilly's Bakery Services",
            jobDescription:
                "Hello, We’re looking for models, influencers and photographers to assist us with our end of the year shoot. We want 2 male models,",
            location: "London",
            time: "3:30 hr",
            appliedCandidateCount: "16",
            jobBudget: "450",
            candidateType: "Anyone",
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
                "Hello, We’re looking for models, influencers and photographers to assist us with our end of the year shoot. We want 2 male models,",
            location: "London",
            time: "3:30 hr",
            appliedCandidateCount: "16",
            jobBudget: "450",
            candidateType: "Anyone",
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
            candidateType: "Anyone",
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
                "Hello, We’re looking for models, influencers and photographers to assist us with our end of the year shoot. We want 2 male models,",
            location: "London",
            time: "3:30 hr",
            appliedCandidateCount: "16",
            jobBudget: "450",
            candidateType: "Anyone",
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
          addVerticalSpacing(40)
        ]),
      ),
    );
  }
}
