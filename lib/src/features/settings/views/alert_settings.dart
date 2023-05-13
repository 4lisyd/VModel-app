import 'package:vmodel/src/features/settings/widgets/cupertino_switch_card.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/vmodel.dart';

class AlertSettingsPage extends StatefulWidget {
  const AlertSettingsPage({super.key});

  @override
  State<AlertSettingsPage> createState() => _AlertSettingsPageState();
}

class _AlertSettingsPageState extends State<AlertSettingsPage> {
  bool alertReceiveBooking = false;
  bool alertFeatureMe = false;
  bool alertLikesContent = false;
  bool alertNewJobMatches = false;
  bool alertReceiveOffer = false;
  bool alertSilenceAllMessages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        appbarTitle: "Alerts Settings",
        leadingIcon: const VWidgetsBackButton(),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 6, 0),
            child: VWidgetsTextButton(
              text: "Done",
              onPressed: () {
                popSheet(context);
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: Column(children: [
          addVerticalSpacing(25),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VWidgetsCupertinoSwitchWithText(
                    titleText: "Alert me when I receive a booking",
                    value: alertReceiveBooking,
                    onChanged: ((p0) {
                      setState(() {
                        alertReceiveBooking = !alertReceiveBooking;
                      });
                    }),
                  ),
                  addVerticalSpacing(6),
                  VWidgetsCupertinoSwitchWithText(
                    titleText: "Alert me when someone feature me",
                    value: alertFeatureMe,
                    onChanged: ((p0) {
                      setState(() {
                        alertFeatureMe = !alertFeatureMe;
                      });
                    }),
                  ),
                  addVerticalSpacing(6),
                  VWidgetsCupertinoSwitchWithText(
                    titleText: "Alert me when someone likes my content",
                    value: alertLikesContent,
                    onChanged: ((p0) {
                      setState(() {
                        alertLikesContent = !alertLikesContent;
                      });
                    }),
                  ),
                  addVerticalSpacing(6),
                  VWidgetsCupertinoSwitchWithText(
                    titleText: "Alert me when a new job matches my settings",
                    value: alertNewJobMatches,
                    onChanged: ((p0) {
                      setState(() {
                        alertNewJobMatches = !alertNewJobMatches;
                      });
                      return alertNewJobMatches;
                    }),
                  ),
                  addVerticalSpacing(6),
                  VWidgetsCupertinoSwitchWithText(
                    titleText: "Alert me when I receive an offer",
                    value: alertReceiveOffer,
                    onChanged: ((p0) {
                      setState(() {
                        alertReceiveOffer = !alertReceiveOffer;
                      });
                    }),
                  ),
                  addVerticalSpacing(6),
                  VWidgetsCupertinoSwitchWithText(
                    titleText: "Silence all messages on dates I'm unavailabe",
                    value: alertSilenceAllMessages,
                    onChanged: ((p0) {
                      setState(() {
                        alertSilenceAllMessages = !alertSilenceAllMessages;
                      });
                      return alertSilenceAllMessages;
                    }),
                  ),
                ],
              ),
            ),
          ),
          addVerticalSpacing(12),
          VWidgetsPrimaryButton(
            buttonTitle: "Done",
            enableButton: true,
            onPressed: () {
              popSheet(context);
            },
          ),
          addVerticalSpacing(40),
        ]),
      ),
    );
  }
}
