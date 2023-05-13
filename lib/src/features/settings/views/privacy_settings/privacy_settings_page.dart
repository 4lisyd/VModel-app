import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

class PrivacySettingsPage extends StatelessWidget {
  const PrivacySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon: VWidgetsBackButton(),
        appbarTitle: "Privacy",
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          addVerticalSpacing(25),
          GestureDetector(
            onTap: () {
            },
            child: Text(
              "Privacy Policies",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: VmodelColors.primaryColor),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          addVerticalSpacing(12),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Terms & Conditions",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: VmodelColors.primaryColor),
            ),
          ),
        ]),
      ),
    );
  }
}
