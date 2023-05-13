import 'package:intl/intl.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/appbar/appbar_title_text.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/date_picker/v_picker.dart';
import 'package:vmodel/src/shared/slider/slider.dart';
import 'package:vmodel/src/shared/text_fields/description_text_field.dart';
import 'package:vmodel/src/shared/text_fields/dropdown_text_field.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class CreateJobSecondPage extends StatefulWidget {
  const CreateJobSecondPage({super.key});

  @override
  State<CreateJobSecondPage> createState() => _CreateJobSecondPageState();
}

class _CreateJobSecondPageState extends State<CreateJobSecondPage> {
  double slideValue = 18;
  double amountSlide = 0;

  String jobType = "On-site";
  String duration = "Full-Day";
  String arrivalTime = "Morning";
  String gender = "Male";
  String ethinicity = "Asian";
  String budget = "Per Day";
  String identifiedGender = "Indentified Gender";
  String height = "5'11";
  String weight = "XL";
  String complexion = "Dark/Melanin";
  TextEditingController dateTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        backgroundColor: VmodelColors.white,
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        appbarTitle: "Choose a category",
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: VWidgetsTextButton(
              text: 'Create',
              //Implement the logic here
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpacing(20),
            VWidgetsDropDownTextField(
              hintText: "",
              options: const ["On-site", "Hybrid", "Remote"],
              fieldLabel: "Job Type",
              onChanged: (val) {
                setState(() {
                  jobType = val;
                });
              },
              value: jobType,
              getLabel: (String value) => value,
            ),

            addVerticalSpacing(25),

            VWidgetsDropDownTextField(
              fieldLabel: "Duration",
              hintText: "",
              options: const ["Full-Day", "Half-Day"],
              onChanged: (val) {
                setState(() {
                  duration = val;
                });
              },
              value: duration,
              getLabel: (String value) => value,
            ),

            addVerticalSpacing(25),

            VWidgetsDropDownTextField(
              fieldLabel: "Arrival Time",
              hintText: "",
              options: const ["Morning", "Afternoon", "Night"],
              value: arrivalTime,
              onChanged: (val) {
                setState(() {
                  arrivalTime = val;
                });
              },
              getLabel: (String value) => value,
            ),

            addVerticalSpacing(25),
            const VWidgetsPrimaryTextFieldWithTitle(
              label: "Location",
              hintText: "Eg. 12 Mayfield Rd",
              //validator: ValidationsMixin.isNotEmpty(value),
              //keyboardType: TextInputType.emailAddress,
              //onSaved: (){},
            ),
            // male, female, trans-Gender, Gender Neutral,
            addVerticalSpacing(25),
            Row(
              children: [
                const Flexible(
                  child: VWidgetsPrimaryTextFieldWithTitle(
                    label: "Postal Code",
                    minLines: 1,
                    hintText: "Ex. E13 8ES",
                    //validator: ValidationsMixin.isNotEmpty(value),
                    //keyboardType: TextInputType.emailAddress,
                    //onSaved: (){},
                  ),
                ),
                addHorizontalSpacing(10),
                const Flexible(
                  child: VWidgetsPrimaryTextFieldWithTitle(
                    label: "City",
                    minLines: 1,
                    hintText: "Ex. London",
                    //validator: ValidationsMixin.isNotEmpty(value),
                    //keyboardType: TextInputType.emailAddress,
                    //onSaved: (){},
                  ),
                ),
              ],
            ),

            addVerticalSpacing(25),

            VWidgetsDropDownTextField(
              fieldLabel: "Birth Gender",
              hintText: "",
              options: const [
                "Male",
                "Female",
                "Trans-Gender",
                "Gender-Neutral"
              ],
              onChanged: (val) {
                setState(() {
                  gender = val;
                });
              },
              value: gender,
              getLabel: (String value) => value,
            ),

            addVerticalSpacing(25),

            VWidgetsDropDownTextField(
              fieldLabel: "Ethnicity",
              hintText: "",
              options: const ["Black/African", "Asian"],
              onChanged: (val) {
                setState(() {
                  ethinicity = val;
                });
              },
              value: ethinicity,
              getLabel: (String value) => value,
            ),

            addVerticalSpacing(25),
             VWidgetsPrimaryTextFieldWithTitle(
              label: "Date",
              minLines: 1,
              hintText: "Date",
              suffixIcon: const Icon(
                Icons.calendar_month_rounded,
                size: 24,
              ),
              controller: dateTime,
              onTap: () {
                VWidgetsDatePickerUI.openVModelDateTimeDialog(
                    selection: (val) {
                      DateFormat date = DateFormat('dd/MM/yyyy');
                      setState(() {
                        dateTime.text = date.format(val).toString();
                      });
                    },
                    context: context);
              },
            ),

            addVerticalSpacing(25),

            VWidgetsDropDownTextField(
              fieldLabel: "Budget",
              hintText: "",
              options: const ["Per Day", "Per Month"],
              onChanged: (val) {
                setState(() {
                  budget = val;
                });
              },
              value: budget,
              getLabel: (String value) => value,
            ),

            addVerticalSpacing(25),
            VWidgetsSlider<double>(
              startLabel: "£0",
              endLabel: "£1000",
              sliderValue: amountSlide,
              sliderMinValue: 0,
              sliderMaxValue: 100,
              onChanged: (value) {
                setState(() {
                  amountSlide = value;
                });
              },
            ),

            addVerticalSpacing(25),

            ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              trailing: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 32,
              ),
              title: Text("Advanced Requirements",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor)),
              children: [
                addVerticalSpacing(25),
                VWidgetsDropDownTextField(
                  fieldLabel: "Identified Gender",
                  hintText: "",
                  options: const ["Indentified Gender", "He", "Him"],
                  onChanged: (val) {
                    setState(() {
                      identifiedGender = val;
                    });
                  },
                  value: identifiedGender,
                  getLabel: (String value) => value,
                ),
                addVerticalSpacing(25),
                Row(
                  children: [
                    Flexible(
                      child: VWidgetsDropDownTextField(
                        fieldLabel: "Height",
                        hintText: "",
                        value: height,
                        onChanged: (val) {
                          setState(() {
                            height = val;
                          });
                        },
                        options: const ["5'11", "5'10", "5'1"],
                        getLabel: (String value) => value,
                      ),
                    ),
                    addHorizontalSpacing(12),
                    Flexible(
                      child: VWidgetsDropDownTextField(
                        fieldLabel: "Weight",
                        hintText: "",
                        onChanged: (val) {
                          setState(() {
                            weight = val;
                          });
                        },
                        value: weight,
                        options: const ["S", "M", "L", "XL", "XXL"],
                        getLabel: (String value) => value,
                      ),
                    ),
                  ],
                ),
                addVerticalSpacing(25),
                Text(
                  "Age Range",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
                addVerticalSpacing(8),
                VWidgetsSlider<double>(
                  startLabel: "18",
                  endLabel: "32",
                  sliderValue: slideValue,
                  sliderMinValue: 18,
                  sliderMaxValue: 32,
                  onChanged: (value) {
                    setState(() {
                      slideValue = value;
                    });
                  },
                ),
                addVerticalSpacing(15),
                VWidgetsDropDownTextField(
                  fieldLabel: "Skin Complexion",
                  hintText: "",
                  onChanged: (val) {
                    setState(() {
                      complexion = val;
                    });
                  },
                  value: complexion,
                  options: const ["Dark/Melanin", "Light"],
                  getLabel: (String value) => value,
                ),
                addVerticalSpacing(25),
                const VWidgetsDescriptionTextFieldWithTitle(
                  label: "Additional Requirements and Features",
                  hintText: "Write a additional requirements and features...",
                  // validator: ValidationsMixin.isNotEmpty(value),
                  //controller: ,
                  //onSaved: (){},
                ),
              ],
            ),

            addVerticalSpacing(25),

            VWidgetsPrimaryButton(
              enableButton: true,
              onPressed: () {},
              buttonTitle: "Create",
            ),

            addVerticalSpacing(50)
          ],
        ),
      ),
    );
  }
}
