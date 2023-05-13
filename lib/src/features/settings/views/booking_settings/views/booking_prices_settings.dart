import 'package:vmodel/src/features/settings/other_options/controller/settings_controller.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/text_fields/counting_textfield.dart';
import 'package:vmodel/src/vmodel.dart';

class BookingPricesSettingsPage extends StatelessWidget {
  const BookingPricesSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    VSettingsController controller = Get.find<VSettingsController>();
    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle: "Prices (Per Hr)",
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 6, 0),
            child: VWidgetsTextButton(
              text: "Done",
              onPressed: () {
                popSheet(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const VWidgetsPagePadding.horizontalSymmetric(18),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    addVerticalSpacing(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Glamour",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    VmodelColors.primaryColor,
                              ),
                        ),
                        addHorizontalSpacing(15),
                        VWidgetsCountingTextField(
                            boxWidth: 20.w,
                            hintText: controller.glamour.toString(),
                            onTapMinus: () {
                              controller.decreaseGlamour();
                            },
                            onTapPlus: () {
                              controller.increaseGlamour();
                            }),
                      ],
                    ),
                    addVerticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Commercial",
                                style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    VmodelColors.primaryColor,
                              ),
                                ),
                        addHorizontalSpacing(15),
                        VWidgetsCountingTextField(
                            boxWidth: 20.w,
                            hintText: controller.cmercial.toString(),
                            onTapMinus: () {
                              controller.decreaseCmercial();
                            },
                            onTapPlus: () {
                              controller.increaseCmercial();
                            }),
                      ],
                    ),
                    addVerticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Fashion",
                               style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    VmodelColors.primaryColor,
                              ),
                                ),
                        addHorizontalSpacing(15),
                        VWidgetsCountingTextField(
                            boxWidth: 20.w,
                            hintText: controller.fashion.toString(),
                            onTapMinus: () {
                              controller.decreaseFashion();
                            },
                            onTapPlus: () {
                              controller.increaseFashion();
                            }),
                      ],
                    ),
                    addVerticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Food",
                               style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    VmodelColors.primaryColor,
                              ),
                                ),
                        addHorizontalSpacing(15),
                        VWidgetsCountingTextField(
                          boxWidth: 20.w,
                          hintText: controller.food.toString(),
                          onTapMinus: () {
                            controller.decreaseFood();
                          },
                          onTapPlus: () {
                            controller.increaseFood();
                          },
                        ),
                      ],
                    ),
                    addVerticalSpacing(20),
                  ],
                ),
              )),
              addVerticalSpacing(12),
              VWidgetsPrimaryButton(
                buttonTitle: "Done",
                onPressed: () {
                  popSheet(context);
                },
                enableButton: true,
              ),
              addVerticalSpacing(40),
            ],
          )),
    );
  }
}
