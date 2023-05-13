import 'package:vmodel/src/features/settings/views/payment/controller/payment_controller.dart';
import 'package:vmodel/src/features/settings/views/payment/controller/payment_interactor.dart';
import 'package:vmodel/src/features/settings/views/payment/widgets/list_card_item.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/vmodel.dart';

class PaymentSettingsPage extends StatelessWidget {
  const PaymentSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentSettingController>(
      init: PaymentSettingController(),
      builder: (s) => Scaffold(
        appBar: VWidgetsAppBar(
          leadingIcon: const VWidgetsBackButton(),
          appbarTitle: "Payment Methods",
          trailingIcon: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 6, 0),
              child: VWidgetsTextButton(
                text: s.isEditable ? 'Done' : 'Edit',
                onPressed: () {
                  s.updateEditable();
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const VWidgetsPagePadding.horizontalSymmetric(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpacing(25),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (s.cards.isEmpty)
                    Column(
                      children: [
                        Text(
                          'No Credit Cards saved yet!',
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: VmodelColors.primaryColor,
                                  ),
                        ),
                         addVerticalSpacing(8),
                    Text(
                      'Add a credit card for secure checkout with Vmodel',
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                            color: VmodelColors.primaryColor.withOpacity(0.5),
                          ),
                    ),
                      ],
                    ),
                   
                  ],
                ),
              )),
              addVerticalSpacing(12),
              VWidgetsPrimaryButton(
                buttonTitle: "Add a Credit Card",
                onPressed: () {
                  PaymentSettingInteractor.onCreatePayment(context);
                },
                enableButton: true,
              ),
               ...s.cards
                .map((e) => ListCardItem(
                      cardName:
                          '${e.card.funding} ${e.card.brand} card (${e.card.cardLastNumbers})',
                      owner: e.holderName,
                      exp:
                          '${e.card.expMonth.toString().padLeft(2, '0')}/${e.card.expYear! % 100}',
                      isDefault: s.defaultId == e.id,
                      isEditable: s.isEditable,
                      onSwitch: (v) => s.setDefaultItem(v ? e.id : ''),
                      onTap: () {
                        PaymentSettingInteractor.removePayment(e);
                      },
                    ))
                .toList(),
              addVerticalSpacing(40),
            ],
          ),
        ),
      ),
    );
  }
}
