import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class PasswordSettingsPage extends StatelessWidget {
  const PasswordSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        appbarTitle: "Password",
        leadingIcon: VWidgetsBackButton(),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(18),
              child: Column(children: [
                addVerticalSpacing(25),
                const VWidgetsPrimaryTextFieldWithTitle(
                  label: "Current Password",
                  hintText: "Enter your current password",
                ),
                addVerticalSpacing(10),
                const VWidgetsPrimaryTextFieldWithTitle(
                  label: "New Password",
                  hintText: "Enter your new password",
                ),
                addVerticalSpacing(10),
                const VWidgetsPrimaryTextFieldWithTitle(
                  label: "Confirm new Password",
                  hintText: "Confirm your new password",
                ),
              ]),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40),
            child: VWidgetsPrimaryButton(
              onPressed: () {
                popSheet(context);
              },
              buttonTitle: "Done",
              enableButton: true,
            ),
          )
        ],
      ),
    );
  }
}
