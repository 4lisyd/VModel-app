import 'package:vmodel/src/features/settings/views/account_settings/views/password_settings_page.dart';
import 'package:vmodel/src/features/settings/views/account_settings/views/personal_settings_page.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';

import '../../../../../shared/popup_dialogs/confirmation_popup.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon: VWidgetsBackButton(),
        appbarTitle: "Security",
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          addVerticalSpacing(25),
          GestureDetector(
            onTap: () {
              navigateToRoute(context, const PersonalSettingsPage());
            },
            child: Text(
              "Personal Information",
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
            onTap: () {
              navigateToRoute(context, const PasswordSettingsPage());
            },
            child: Text(
              "Password Settings",
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
            onTap: () {

            },
            child: Text(
              "Two factor authentication",
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) =>  VWidgetsConfirmationPopUp(
                    popupTitle: "Deactivate account",
                    popupDescription: "Are you sure you want to deactivate your account? You will not be able to access your account until you reactivate it.",
                    onPressedYes: () {
                      Navigator.pop(context);
                    },
                    onPressedNo: () {
                      Navigator.pop(context);
                    },
                  )));

            },
            child: Text(
              "Deactivate account",
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) =>  VWidgetsConfirmationPopUp(
                    popupTitle: "Pause account",
                    popupDescription: "Are you sure you want to pause your account? You will not be able to access your account until you reactivate it.",
                    onPressedYes: () {
                      Navigator.pop(context);
                    },
                    onPressedNo: () {
                      Navigator.pop(context);
                    },
                  )));
            },
            child: Text(
              "Pause account",
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
