import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmodel/src/core/api/graphql_service.dart';
import 'package:vmodel/src/features/dashboard/dash/dashboard_ui.dart';
import 'package:vmodel/src/features/settings/other_options/controller/settings_controller.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/text_fields/description_text_field.dart';
import 'package:vmodel/src/shared/text_fields/dropdown_text_field.dart';
import 'package:vmodel/src/shared/text_fields/initial_text_field.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class ProfileSettingPage extends ConsumerStatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  ConsumerState<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends ConsumerState<ProfileSettingPage> {
  String dropdownIdentifyValue = "Male";
  String? dropdownFeetValue = '4';
  String? dropdownInchesValue = '0';
  String dropdownEthnicityValue = "Other";
  TextEditingController _bio = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _chest = TextEditingController();
  TextEditingController _hair = TextEditingController();
  TextEditingController _eyes = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  String dropdownBodyTypeValue = "Slim";
  String dropdownPetValue = "Dog";
  String dropdownDogBreedValue = "Siberian Husky";
  String dropdownGenderValue = "Male";
  // bool isPetCheckboxValue = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  int _pk = 0;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pk = (prefs.getInt('pk') ?? 0);
      print(_pk);
    });
  }

  @override
  void initState() {
    final authNotifier = ref.read(authProvider.notifier);
    final height = authNotifier.state.height?.split('\'') ;
    dropdownFeetValue = height == null ? '4' : height[0];
    dropdownInchesValue = height == null ? '0' : height[1];
    _username.text = authNotifier.state.username ?? '';
    _firstName.text  = authNotifier.state.firstName ?? '';
    _lastName.text = authNotifier.state.lastName ?? '';
    _weight.text = authNotifier.state.weight ?? '';
    _hair.text = authNotifier.state.hair ?? '';
    _chest.text = authNotifier.state.chest ?? '';
    _eyes.text = authNotifier.state.eyes ?? '';
    _bio.text = authNotifier.state.bio ?? '';
    _loadCounter();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<VSettingsController>();
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: VWidgetsAppBar(
        leadingIcon: const VWidgetsBackButton(),
        appbarTitle: "Profile Settings",
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 6, 0),
            child: VWidgetsTextButton(
              text: "Done",
              onPressed: () async{
                final authNotifier = ref.read(authProvider.notifier);
                await authNotifier.userUpdate(_pk != 0 ? _pk : authNotifier.state.pk!.toInt(), _bio.text, '$dropdownFeetValue\'$dropdownInchesValue', _username.text.capitalizeFirst!.trim(), _firstName.text.capitalizeFirst!.trim(), _lastName.text.capitalizeFirst!.trim(), _weight.text.trim(), _hair.text.capitalizeFirst!.trim(), _eyes.text.capitalizeFirst!.trim(), _chest.text.trim());
                await authNotifier.getUser(_pk != 0 ? _pk : ref.read(authProvider.notifier).state.pk!.toInt());
                popSheet(context);
                navigateAndRemoveUntilRoute(context, const DashBoardView());
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const VWidgetsPagePadding.horizontalSymmetric(18),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addVerticalSpacing(20),
                VWidgetsPrimaryTextFieldWithTitle(
                  label: "Firstname",
                  controller: _firstName,
                  hintText: "Enter first name",
                ),
                addVerticalSpacing(10),
                VWidgetsPrimaryTextFieldWithTitle(
                  label: "Lastname",
                  controller: _lastName,
                  hintText: "Enter last name",
                ),
                addVerticalSpacing(10),
                VWidgetsPrimaryTextFieldWithTitle(
                  label: "Username",
                  controller: _username,
                  hintText: "Ex. Vmodel",
                ),
                addVerticalSpacing(10),
                VWidgetsDescriptionTextFieldWithTitle(
                  minLines: 4,
                  label: "Bio",
                  controller: _bio,
                  hintText: "Here's my Bio ...",
                  // onSaved: (p0) {
                  //   controller.bio(p0);
                  //   _bio;
                  // },
                  // onChanged: (p0) => controller.bio(p0),
                ),

                addVerticalSpacing(20),
                VWidgetsDropDownTextField(
                  fieldLabel: "Birth Gender",
                  hintText: "",
                  value: dropdownGenderValue,
                  onChanged: (val) {
                    setState(() {
                      dropdownGenderValue = val;
                    });
                  },
                  options: const [
                    'Male',
                    'Female',
                  ],
                ),
                addVerticalSpacing(20),
                VWidgetsDropDownTextField(
                  fieldLabel: "I Identify as",
                  hintText: "",
                  value: dropdownIdentifyValue,
                  onChanged: (val) {
                    setState(() {
                      dropdownIdentifyValue = val;
                    });
                  },
                  options: const [
                    'Male',
                    'Female',
                    "I'm representing a Pet",
                    'Androgyne',
                    'Bigender',
                    'Butch',
                    'Cisgender',
                    'Gender Expansive',
                    'Gender Fluid',
                    'Gender Outlaw',
                    'Gender Queer',
                    'Masculine of center',
                    'Non-binary',
                    'Omnigender',
                    'Polygender and Pangender',
                    'Transgender',
                    'Trans',
                    'Two Spirit'
                  ],
                ),
                // addVerticalSpacing(10),
                // Row(
                //   children: [
                //     Checkbox(
                //       checkColor: Colors.white,
                //       activeColor: VmodelColors.buttonColor,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4)),
                //       value: isPetCheckboxValue,
                //      onChanged: (value) {
                //        setState(() {
                //         isPetCheckboxValue = !isPetCheckboxValue;
                //        });
                //      },
                //     ),
                //     Text(
                //       'I\'m representing a pet',
                //       style: VModelTypography1.promptTextStyle
                //         ..copyWith(fontSize: 14),
                //     ),
                //   ],
                // ),
                addVerticalSpacing(20),
                if (dropdownIdentifyValue != "I'm representing a Pet")
                  Column(
                    children: [
                      VWidgetsDropDownTextField(
                        fieldLabel: "What's your ethnicity",
                        hintText: "",
                        value: dropdownEthnicityValue,
                        onChanged: (val) {
                          setState(() {
                            dropdownEthnicityValue = val;
                          });
                        },
                        options: const [
                          "White",
                          "Asian",
                          "Black",
                          "Native American",
                          "Hispanic or Latino",
                          "Pacific Islander",
                          "Mixed",
                          "Other"
                        ],
                      ),
                      addVerticalSpacing(20),
                      Row(
                        children: [
                          Flexible(
                            child: VWidgetsDropDownTextField(
                              fieldLabel: "Height in Feet",
                              hintText: "",
                              value: dropdownFeetValue,
                              onChanged: (val) {
                                setState(() {
                                  dropdownFeetValue = val;
                                });
                              },
                              options: const ['4', '5', '6', '7', '8'],
                            ),
                          ),
                          addHorizontalSpacing(6),
                          Flexible(
                            child: VWidgetsDropDownTextField(
                              fieldLabel: "Inches",
                              hintText: "",
                              value: dropdownInchesValue,
                              onChanged: (val) {
                                setState(() {
                                  dropdownInchesValue = val;
                                });
                              },
                              options: const [
                                '0',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                                '8',
                                '9',
                                '10',
                                '11',
                                '12'
                              ],
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpacing(20),
                      Row(
                        children: [
                          Flexible(
                            child: VWidgetsPrimaryTextFieldWithTitle(
                              label: "Weight",
                              controller: _weight,
                              hintText: "E.g. 36",

                            ),
                          ),
                          addHorizontalSpacing(6),
                          Flexible(
                            child: VWidgetsPrimaryTextFieldWithTitle(
                              label: "Chest",
                              controller: _chest,
                              hintText: "E.g. 38",

                            ),
                          ),
                        ],
                      ),
                      addVerticalSpacing(20),
                      Row(
                        children: [
                          Flexible(
                            child: VWidgetsPrimaryTextFieldWithTitle(
                              label: "Hair Color",
                              controller: _hair,
                              hintText: "E.g. Brown",

                            ),
                          ),
                          addHorizontalSpacing(6),
                          Flexible(
                            child: VWidgetsPrimaryTextFieldWithTitle(
                              label: "Eye Color",
                              controller: _eyes,
                              hintText: "E.g. Brown",

                            ),
                          ),
                        ],
                      ),
                      addVerticalSpacing(20)
                    ],
                  ),
                if (dropdownIdentifyValue == "I'm representing a Pet")
                  Column(
                    children: [
                      VWidgetsDropDownTextField(
                        fieldLabel: "Select Pet Type",
                        hintText: "",
                        value: dropdownPetValue,
                        onChanged: (val) {
                          setState(() {
                            dropdownPetValue = val;
                          });
                        },
                        options: const [
                          "Add my own",
                          "Dog",
                          "Cat",
                          "Hamster",
                          "Fish",
                          "Bird",
                          "Reptile",
                          "Rabbit",
                          "Poultry",
                          "Ferret",
                          "Guinea Pig",
                        ],
                      ),
                    ],
                  ),
                if (dropdownPetValue == "Dog" &&
                    dropdownIdentifyValue == "I'm representing a Pet")
                  Column(
                    children: [
                      addVerticalSpacing(20),
                      VWidgetsDropDownTextField(
                        fieldLabel: "Select Breed",
                        hintText: "",
                        value: dropdownDogBreedValue,
                        onChanged: (val) {
                          setState(() {
                            dropdownDogBreedValue = val;
                          });
                        },
                        options: const [
                          "Siberian Husky",
                          "Golden retriever",
                          "Labrador retriever",
                          "French bulldog",
                          "Beagle",
                          "German shepherd dog",
                          "Poodle",
                          "Bulldog"
                        ],
                      ),
                    ],
                  ),
                if (dropdownPetValue == "Add my own" &&
                    dropdownIdentifyValue == "I'm representing a Pet")
                  Column(
                    children: [
                      addVerticalSpacing(10),
                      const VWidgetsTextFieldWithoutTitle(hintText: "Pet Type"),
                      addVerticalSpacing(10),
                      const VWidgetsTextFieldWithoutTitle(
                          hintText: "Pet Breed"),
                      addVerticalSpacing(20)
                    ],
                  ),
                addVerticalSpacing(40),
                // VWidgetsDropDownTextField(
                //         fieldLabel: "Body Type",
                //         hintText: "",
                //         value: dropdownBodyTypeValue,
                //         onChanged: (val) {
                //           setState(() {
                //             dropdownBodyTypeValue = val;
                //           });
                //         },
                //         options:  controller.gender.value == 'male' ?
                //         ["Slim","Tone","Muscular","Stocky","Large"]
                //         :["Slim","Rectangle","Triangle","Hourglass","Inverted","Round"],
                //       ),
                // addVerticalSpacing(20),
                VWidgetsPrimaryButton(
                  buttonTitle: "Done",
                  onPressed: () async{
                    final authNotifier = ref.read(authProvider.notifier);
                    await authNotifier.userUpdate(_pk != 0 ? _pk : authNotifier.state.pk!.toInt(), _bio.text, '$dropdownFeetValue\'$dropdownInchesValue', _username.text.capitalizeFirst!.trim(), _firstName.text.capitalizeFirst!.trim(), _lastName.text.capitalizeFirst!.trim(), _weight.text.trim(), _hair.text.capitalizeFirst!.trim(), _eyes.text.capitalizeFirst!.trim(), _chest.text.trim());
                    await authNotifier.getUser(_pk != 0 ? _pk : ref.read(authProvider.notifier).state.pk!.toInt());
                    popSheet(context);
                    navigateAndRemoveUntilRoute(context, const DashBoardView());
                  },
                  enableButton: true,
                ),
                addVerticalSpacing(40),
              ]),
        ),
      ),
    );
  }
}
