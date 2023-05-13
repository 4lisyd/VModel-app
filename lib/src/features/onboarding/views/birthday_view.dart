import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:vmodel/src/features/onboarding/controller/onboarding_controller.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/core/utils/validators_mixins.dart';
import 'package:vmodel/src/vmodel.dart';

class OnboardingBirthday extends StatelessWidget with ValidationsMixin {
  OnboardingBirthday({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: VmodelColors.background,
        appBar: AppBar(
          leading: const VWidgetsBackButton(),
          backgroundColor: VmodelColors.background,
          elevation: 0,
          iconTheme: IconThemeData(color: VmodelColors.mainColor),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.04),
              child: VWidgetsTextButton(
                text: 'Skip',
                onPressed: () {
                  OnboardingInteractor.onBirthdaySubmitted(context);
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            vmSizedH(SizeConfig.screenHeight * 0.22),
            Center(
              child: Text(
                'Please enter your date of birth',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                  fontSize: 13.sp),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              //width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                  key: formKey,
                  child: Container(
                    color: Colors.white.withOpacity(0.001),
                    height: SizeConfig.screenHeight * 0.12,
                    child: Obx(() {
                      return ScrollDatePicker(
                        options: const DatePickerOptions(
                          isLoop: false,
                          diameterRatio: 3,
                          itemExtent: 30,
                          //itemExtent: 3.0
                        ),
                        scrollViewOptions: DatePickerScrollViewOptions(
                          day: ScrollViewDetailOptions(
                            alignment: Alignment.centerLeft,
                            textStyle: datePickerTextStyle,
                            selectedTextStyle: selectedDatePickerTextStyle,
                            margin: const EdgeInsets.all(14.0),
                          ),
                          month: ScrollViewDetailOptions(
                            alignment: Alignment.center,
                            textStyle: datePickerTextStyle,
                            selectedTextStyle: selectedDatePickerTextStyle,
                            margin: const EdgeInsets.only(right: 14),
                          ),
                          year: ScrollViewDetailOptions(
                            alignment: Alignment.centerRight,
                            textStyle: datePickerTextStyle,
                            selectedTextStyle: selectedDatePickerTextStyle,
                            margin: const EdgeInsets.only(right: 14),
                          ),
                        ),
                        selectedDate:
                            Get.find<OnboardingController>().birthday.value,
                        onDateTimeChanged: (value) {
                          Get.find<OnboardingController>().birthday(value);
                        },
                        locale: const Locale(
                          'ko',
                        ),
                        maximumDate: DateTime(2006, 12, 30),
                        indicator: null,
                      );
                    }),
                  )),
            ),
            vmSizedH(SizeConfig.screenHeight * 0.071),
            Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${getDay(
                      Get.find<OnboardingController>().birthday.value,
                    ).toUpperCase()} baby! 😍',
                    style: promptTextStyle.copyWith(fontSize: 12),
                  ),
                  vmSizedH(15),
                  RichText(
                    text: TextSpan(
                      style: promptTextStyle,
                      children: [
                        TextSpan(
                          text: getAge(
                              Get.find<OnboardingController>().birthday.value),
                          style: promptTextStyle.copyWith(
                              fontSize: 90, fontWeight: FontWeight.w500),
                        ),
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'Years Old',
                          style: promptTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  // vmSized(20),
                  Center(
                      child: getStarSign(
                          Get.find<OnboardingController>().birthday.value))
                ],
              );
            }),
            vmSpacer(),
            Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(18),
              child: VWidgetsPrimaryButton(
                onPressed: () {
                 if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState!.save();
                  OnboardingInteractor.onBirthdaySubmitted(context);
                }
                },
                enableButton: true,
                buttonTitle: 'Continue',
              ),
            ),
            addVerticalSpacing(40),
            
          ],
        ));
  }

  String getDay(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  Widget getStarSign(DateTime date) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '⚛',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          getZodicaSign(date),
        )
      ],
    );
  }

  String getZodicaSign(DateTime date) {
    var days = date.day;
    var months = date.month;
    if (months == 1) {
      if (days >= 21) {
        return "Aquarius";
      } else {
        return "Capricorn";
      }
    } else if (months == 2) {
      if (days >= 20) {
        return "Pisces";
      } else {
        return "Aquarius";
      }
    } else if (months == 3) {
      if (days >= 21) {
        return "Aries";
      } else {
        return "Pisces";
      }
    } else if (months == 4) {
      if (days >= 21) {
        return "Taurus";
      } else {
        return "Aries";
      }
    } else if (months == 5) {
      if (days >= 22) {
        return "Gemini";
      } else {
        return "Taurus";
      }
    } else if (months == 6) {
      if (days >= 22) {
        return "Cancer";
      } else {
        return "Gemini";
      }
    } else if (months == 7) {
      if (days >= 23) {
        return "Leo";
      } else {
        return "Cancer";
      }
    } else if (months == 8) {
      if (days >= 23) {
        return "Virgo";
      } else {
        return "Leo";
      }
    } else if (months == 9) {
      if (days >= 24) {
        return "Libra";
      } else {
        return "Virgo";
      }
    } else if (months == 10) {
      if (days >= 24) {
        return "Scorpio";
      } else {
        return "Libra";
      }
    } else if (months == 11) {
      if (days >= 23) {
        return "Sagittarius";
      } else {
        return "Scorpio";
      }
    } else if (months == 12) {
      if (days >= 22) {
        return "Capricorn";
      } else {
        return "Sagittarius";
      }
    }
    return "";
  }

  String getAge(DateTime date) {
    final today = DateTime.now();
    var age = today.year - date.year;
    final month1 = today.month;
    final month2 = date.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      final day1 = today.day;
      final day2 = date.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }
}
