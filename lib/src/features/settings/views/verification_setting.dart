import 'package:flutter_svg/flutter_svg.dart';
import 'package:vmodel/src/features/settings/views/verification/views/verify_identity_view.dart';
import 'package:vmodel/src/features/settings/views/verification/widget/verify_option.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/vmodel.dart';



class VerificationSettingPage extends StatelessWidget {
  const VerificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle: "Verification",
        trailingIcon: [
             Padding(
            padding: const EdgeInsets.fromLTRB(0,12,6,0),
            child: VWidgetsTextButton(
              text: "Done",
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vmSizedH(30),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(VIcons.securityUserIcon, width: 39.42, height: 45.83,),
                   vmSizedH(20),
                   Text("Verifying your identity",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600,
                    fontSize: 18, color: VmodelColors.primaryColor),),

                  vmSizedH(15),

                  Padding(
                    padding: const VWidgetsPagePadding.horizontalSymmetric(20),
                    child: Text("We need to check that you are who you say you are. Here’s how it works",
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w500,
                      fontSize: 14, color: VmodelColors.primaryColor), textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),

            vmSizedH(50),

            Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(20),
              child: Column(
                children: [

                  const VerifyOption(
                       text: "Take a picture of a valid photo ID To check your personal information is correct",
                      iconPath:  VIcons.user3Icon,
              ),

                  vmSizedH(20),

                  const VerifyOption(
                    text: "Record a short video of yourself to match your face to your ID photos",
                    iconPath: VIcons.recordIcon,
                  ),


                  vmSizedH(40),

                  VWidgetsPrimaryButton(buttonTitle: "Get started", onPressed: (){
                  navigateToRoute(context, const VerifyYourIdentity());
                  }, enableButton: true,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}