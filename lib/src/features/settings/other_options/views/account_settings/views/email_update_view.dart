import 'package:vmodel/src/features/settings/other_options/controller/account_settings_controller.dart';
import 'package:vmodel/src/res/res.dart';

import 'package:vmodel/src/shared/text_fields/initial_text_field.dart';
import 'package:vmodel/src/core/utils/validators_mixins.dart';
import 'package:vmodel/src/vmodel.dart';

class EmailUpdateView extends StatelessWidget with ValidationsMixin {
  const EmailUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AccountSettignsController>();

    return Obx(() {
      return Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25, top: 20, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: VModelTypography1.promptTextStyle
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            vmSizedH(8),
            VWidgetsTextFieldWithoutTitle(
              hintText: 'Email',
              onSaved: (p0) {
                controller.email(p0);
              },
              validator: ValidationsMixin.isEmailValid,
              onChanged: (p0) => controller.email(p0),
              onFieldSubmitted: (p0) => controller.email(p0),
            ),
            vmSpacer(),
            vWidgetsInitialButton(
              controller.email.value.trim().length < 4 ? null : () {},
              'Done',
            ),
            vmSizedH(24),
          ],
        ),
      );
    });
  }
}
