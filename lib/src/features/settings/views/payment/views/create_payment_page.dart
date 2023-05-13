import 'package:flutter/cupertino.dart';
import 'package:vmodel/src/features/settings/views/payment/controller/card_utils.dart';
import 'package:vmodel/src/features/settings/views/payment/controller/payment_interactor.dart';
import 'package:vmodel/src/features/settings/views/payment/data/card_object.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/loader/full_screen.dart';
import 'package:vmodel/src/vmodel.dart';
import '../../../../../res/res.dart';

class CreatePaymentPage extends StatefulWidget {
  const CreatePaymentPage({Key? key}) : super(key: key);

  @override
  State<CreatePaymentPage> createState() => _CreatePaymentPageState();
}

class _CreatePaymentPageState extends State<CreatePaymentPage> {
  bool _isDefault = false;
  final _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _cvc = '';
  String _holderName = '';
  String _exp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle: "Add Credit Card",
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 6, 0),
            child: VWidgetsTextButton(
              text: 'Save',
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ProgressHUD(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 21),
            children: [
              Text(
                "Card Number",
                style:
                    descriptionTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              vmSizedH(8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration(hint: '3456 1234 5678 9101')
                    .copyWith(
                        suffixIcon: const Icon(Icons.camera_alt_outlined)),
                inputFormatters: [CardUtils.cardTextInputFormatter],
                validator: CardUtils.validateCardNum,
                style: descriptionTextStyle.copyWith(
                    color: VmodelColors.textColor),
                onSaved: (v) => _cardNumber = v!,
              ),
              vmSizedH(21),
              Text(
                "Card holder name",
                style:
                    descriptionTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              vmSizedH(8),
              TextFormField(
                decoration: inputDecoration(hint: 'Ex. Jane Cooper'),
                style: descriptionTextStyle.copyWith(
                    color: VmodelColors.textColor),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input Card Holder Name';
                  }
                  return null;
                },
                onSaved: (v) => _holderName = v!,
              ),
              vmSizedH(21),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiration date",
                        style: descriptionTextStyle.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                      vmSizedH(8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration(hint: 'MM/YY'),
                        inputFormatters: [
                          CardUtils.expirationTextInputFormatter,
                        ],
                        validator: CardUtils.validateDate,
                        style: descriptionTextStyle.copyWith(
                            color: VmodelColors.textColor),
                        onSaved: (v) => _exp = v!,
                      ),
                    ],
                  )),
                  vmSizedW(10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Security code",
                        style: descriptionTextStyle.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                      vmSizedH(8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration(hint: 'CVC'),
                        inputFormatters: [
                          CardUtils.cvcTextInputFormatter,
                        ],
                        validator: CardUtils.validateCVV,
                        style: descriptionTextStyle.copyWith(
                            color: VmodelColors.textColor),
                        onSaved: (v) => _cvc = v!,
                      ),
                    ],
                  )),
                ],
              ),
              vmSizedH(21),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Set as a default card',
                    style: descriptionTextStyle,
                  ),
                  SizedBox(
                    height: 28,
                    child: CupertinoSwitch(
                      value: _isDefault,
                      onChanged: (v) => setState(() => _isDefault = v),
                      activeColor: VmodelColors.mainColor,
                    ),
                  )
                ],
              ),
              vmSizedH(16),
              VWidgetsPrimaryButton(
                buttonTitle: "Save card",
                enableButton: true,
                onPressed: () {
                onSaveCard();
              }
              ),

            ],
          ),
        ),
      ),
    );
  }

  onSaveCard() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      int expMonth = CardUtils.getExpiryDate(_exp)[0];
      int expYear = 2000 + CardUtils.getExpiryDate(_exp)[1];
      CardObject card = CardObject(
          cardNumbers: _cardNumber,
          cvc: _cvc,
          expMonth: expMonth,
          expYear: expYear);
      PaymentSettingInteractor.onSaveCard(card, _holderName, _isDefault);
    }
  }
}
