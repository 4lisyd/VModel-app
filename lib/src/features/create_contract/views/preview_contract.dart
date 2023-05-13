import 'package:vmodel/src/res/typography/textstyle.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/appbar/appbar_title_text.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/vmodel.dart';
import 'package:vmodel/src/res/res.dart';

class PreviewContractView extends StatefulWidget {
  const PreviewContractView({super.key});

  @override
  State<PreviewContractView> createState() => _PreviewContractViewState();
}

class _PreviewContractViewState extends State<PreviewContractView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VmodelColors.contractBackgroundColor,
      appBar: const VWidgetsAppBar(
        appBarHeight: 50,
        backgroundColor: Colors.white,
        leadingIcon: Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        appbarTitle: "Create a contract",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: SizeConfig.screenHeight * 0.17,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Client',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(8),
                                  const Text('VModel'),
                                  vmSizedH(5),
                                  const Text('admin@vmodel.app'),
                                  vmSizedH(5),
                                  const Text('+44 755474957'),
                                ]),
                          ),
                        ),
                        vmSizedH(18),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: SizeConfig.screenHeight * 0.17,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Contractor',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(8),
                                  const Text('Sarah Tierney'),
                                  vmSizedH(5),
                                  const Text('sarahtierney@gmail.com'),
                                  vmSizedH(5),
                                  const Text('+44 755474957'),
                                ]),
                          ),
                        ),
                        vmSizedH(
                          18,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: SizeConfig.screenHeight * 0.28,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Contract Length',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(8),
                                  const Text('15 Sep 2022 - 25 Sep 2022'),
                                  vmSizedH(8),
                                  Text(
                                    'Type',
                                    style: VmodelTypography2.kBoldTextStyle,
                                  ),
                                  vmSizedH(8),
                                  const Text('Hybrid'),
                                  vmSizedH(8),
                                  Text(
                                    'Address',
                                    style: VmodelTypography2.kBoldTextStyle,
                                  ),
                                  vmSizedH(8),
                                  const Text('12 Mayfield Rd, London'),
                                  vmSizedH(5),
                                  const Text('E13 8ES'),
                                ]),
                          ),
                        ),
                        vmSizedH(
                          18,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: SizeConfig.screenHeight * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      Text(
                                        'Rate',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      Text(
                                        'Qty',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      Text(
                                        'Subtotal',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                  Divider(color: VmodelColors.borderColor),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Commercial',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                      Text(
                                        '£250.00',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Runway',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                      Text(
                                        '£1500.00',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Instagram',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                      Text(
                                        '£50.00',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: VmodelColors.borderColor,
                                  ),
                                  vmSizedH(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Subtotal',
                                        style: VmodelTypography2.kCommentTextStyle
                                            .copyWith(
                                                color: const Color(0xff666666)
                                                    .withOpacity(0.5)),
                                      ),
                                      Text(
                                        '£155.00',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Discount(10%)',
                                        style: VmodelTypography2.kCommentTextStyle
                                            .copyWith(
                                                color: const Color(0xff666666)
                                                    .withOpacity(0.5)),
                                      ),
                                      Text(
                                        '-£50.00',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                    ],
                                  ),
                                  vmSizedH(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tax',
                                        style: VmodelTypography2.kCommentTextStyle
                                            .copyWith(
                                                color: const Color(0xff666666)
                                                    .withOpacity(0.5)),
                                      ),
                                      Text(
                                        '£5.00',
                                        style:
                                            VmodelTypography2.kCommentTextStyle,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: VmodelColors.borderColor,
                                  ),
                                  vmSizedH(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Grand Total',
                                          style:
                                              VmodelTypography2.kBoldTextStyle),
                                      Text(
                                        '£450.00',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                        vmSizedH(18),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: SizeConfig.screenHeight * 0.24,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terms & conditions',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                        vmSizedH(18),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: SizeConfig.screenHeight * 0.17,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Signature',
                                        style: VmodelTypography2.kBoldTextStyle,
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/signature.png',
                                    height: 50,
                                    width: 150,
                                  ),
                                ]),
                          ),
                        ),
                        vmSizedH(18),
                        VWidgetsPrimaryButton(
                          onPressed: () {
                            // navigateToRoute(context, const PreviewContractView());
                          },
                          buttonTitle: 'Continue',
                          enableButton: true,
                          buttonHeight: 40,
                          buttonTitleTextStyle: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
