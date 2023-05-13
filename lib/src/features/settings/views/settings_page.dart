import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vmodel/src/core/api/graphql_service.dart';
import 'package:vmodel/src/features/settings/views/account_settings/views/account_settings.dart';
import 'package:vmodel/src/features/settings/views/alert_settings.dart';
import 'package:vmodel/src/features/settings/views/booking_settings/views/booking_settings.dart';
import 'package:vmodel/src/features/settings/views/payment/views/payments_homepage.dart';
import 'package:vmodel/src/features/settings/views/privacy_settings/privacy_settings_page.dart';
import 'package:vmodel/src/features/settings/views/profile_settings.dart';
import 'package:vmodel/src/features/settings/views/verification_setting.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar_title_text.dart';
import 'package:vmodel/src/vmodel.dart';
import '../../../shared/loader/full_screen.dart';
import '../other_options/controller/settings_controller.dart';
import'dart:io';

class SettingsSheet extends ConsumerStatefulWidget {
  const SettingsSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends ConsumerState<SettingsSheet> {
  _buildRedirectingMenuItem(
      BuildContext context, String title, Widget nextScreen) {
    return InkWell(
      onTap: () {
        navigateToRoute(context, nextScreen);
      },
      child: Column(
        children: [
          addVerticalSpacing(13),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Text(title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
              ]),
        ],
      ),
    );
  }

  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context,) {
    final authNotifier = ref.read(authProvider.notifier);
    Get.put(VSettingsController());

    List menuItems = [
      _buildRedirectingMenuItem(
        context,
        'Profile',
        const ProfileSettingPage(),
      ),
      _buildRedirectingMenuItem(
        context,
        'Payments',
        const PaymentSettingsHomepage(),
      ),
      _buildRedirectingMenuItem(
        context,
        'Verification',
        const VerificationSettingPage(),
      ),
      _buildRedirectingMenuItem(
        context,
        'Bookings',
        const BookingSettingsPage(),
      ),
      _buildRedirectingMenuItem(
          context, 'Account', const AccountSettingsPage()),

      _buildRedirectingMenuItem(
        context,
        'Alerts',
        const AlertSettingsPage(),
      ),

       _buildRedirectingMenuItem(
          context, 'Security', const AccountSettingsPage()),
          _buildRedirectingMenuItem(
          context, 'Privacy', const PrivacySettingsPage()),
    ];

    return ProgressHUD(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.5,
              backgroundColor: VmodelColors.background,
              leading: const VWidgetsBackButton(),
              title: const VWidgetsAppBarTitleText(titleText: "Settings"),
            ),
            backgroundColor: VmodelColors.background,
            bottomSheet: Container(
              color: VmodelColors.background,
              height: SizeConfig.screenHeight * 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  vmSizedH(4),
                  Container(
                    height: 117,
                    width: 117,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: VmodelColors.mainColor, width: 4),
                    ),
                    child: ClipOval(
                      child: _image != null ? Image.file(_image!, fit: BoxFit.cover, height: 117, width: 117,) : Image.network(
                        'https://vmodel-app.herokuapp.com/media/${authNotifier.state.profilePicture}',
                        fit: BoxFit.cover,
                        height: 117,
                        width: 117,
                      ),
                    ),
                  ),
                  addVerticalSpacing(15),
                  GestureDetector(
                    onTap: () async{
                      final progress = ProgressHUD.of(context);
                      await _openImagePicker();
                      // if(_image != null) {
                      progress?.show();
                      final bytes = await _image!.readAsBytes();
                      String base64Image = base64Encode(bytes);
                      // progress?.show();
                      await authNotifier.pictureUpdate(authNotifier.state.pk!, base64Image, 'profilePicture');
                      progress?.dismiss();
    // }
                    },
                      child: Text('Edit Headshot', style: VModelTypography1.sheetCenterCTA)),
                  addVerticalSpacing(25),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 18,
                          right: 20,
                        ),
                        child: ListView.separated(
                            itemBuilder: ((context, index) => menuItems[index]),
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: menuItems.length),
                      ),
                    ),
                  ),
                  addVerticalSpacing(30),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
