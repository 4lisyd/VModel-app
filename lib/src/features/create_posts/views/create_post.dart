import 'package:vmodel/src/features/create_posts/widgets/add_new_album_popup.dart';
import 'package:vmodel/src/features/create_posts/widgets/dropdown_texfield_with_trailing_icon.dart';
import 'package:vmodel/src/features/create_posts/widgets/image_with_stack_icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/text_fields/description_text_field.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

import '../../settings/widgets/cupertino_switch_card.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String selectedChip = "Model";
  bool isImageSelected = false;
  bool alertComment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        backgroundColor: VmodelColors.white,
        appBarHeight: 50,
        leadingIcon: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: VWidgetsBackButton(),
        ),
        appbarTitle: "New post",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView(
          padding: const VWidgetsPagePadding.horizontalSymmetric(18),
          children: [
            addVerticalSpacing(20),
            SizedBox(
              height: 142,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  VWidgetsStackImage(
                    image: const AssetImage("assets/images/models/model_11.png"),
                    bottomLeftIconOnPressed: () {},
                    topRightIconOnPressed: () {},
                     isImageSelected: isImageSelected,
                    onTapImage: () {
                      setState(() {
                        isImageSelected = !isImageSelected;
                      });
                    },
                  ),
                  VWidgetsStackImage(
                    image: const AssetImage("assets/images/models/model_11.png"),
                    bottomLeftIconOnPressed: () {},
                    topRightIconOnPressed: () {},
                     isImageSelected: isImageSelected,
                    onTapImage: () {
                      setState(() {
                        isImageSelected = !isImageSelected;
                      });
                    },
                  ),
                  VWidgetsStackImage(
                    image: const AssetImage("assets/images/models/model_11.png"),
                    bottomLeftIconOnPressed: () {},
                    topRightIconOnPressed: () {},
                     isImageSelected: isImageSelected,
                    onTapImage: () {
                      setState(() {
                        isImageSelected = !isImageSelected;
                      });
                    },
                  ),
                  VWidgetsStackImage(
                    image: const AssetImage("assets/images/models/model_11.png"),
                    bottomLeftIconOnPressed: () {},
                    topRightIconOnPressed: () {},
                     isImageSelected: isImageSelected,
                    onTapImage: () {
                      setState(() {
                        isImageSelected = !isImageSelected;
                      });
                    },
                  ),
                ],
              ),
            ),

            addVerticalSpacing(25),
            const VWidgetsPrimaryTextFieldWithTitle(
              label: "Features",
              hintText: "@",
              // validator: ValidationsMixin.isNotEmpty(value),
              //controller: ,
              //onSaved: (){},
            ),
            // addVerticalSpacing(25),
            //! Check for from where is extra padding coming
            VWidgetsDropDownTextFieldWithTrailingIcon(
              fieldLabel: "Add to Album",
              hintText: "Commercial",
              options: const ["Commercial", "Commercial"],
              getLabel: (String value) => value,
              onPressedIcon: () {
                showDialog(
                    context: context,
                    builder: ((context) => VWidgetsAddAlbumPopUp(
                          popupTitle: "Create a new album",
                          buttonTitle: "Continue",
                          onPressed: () {},
                        )));
              },
            ),
            addVerticalSpacing(25),
            const VWidgetsPrimaryTextFieldWithTitle(
              label: "Location",
              hintText: "Ex. London",
              // validator: ValidationsMixin.isNotEmpty(value),
              //controller: ,
              //onSaved: (){},
            ),
            addVerticalSpacing(25),
            const VWidgetsDescriptionTextFieldWithTitle(
              label: "Add Caption",
              hintText: "Start typing...",

              // validator: ValidationsMixin.isNotEmpty(value),
              //controller: ,
              //onSaved: (){},
            ),
            addVerticalSpacing(15),
            VWidgetsCupertinoSwitchWithText(
              titleText: "Allow comments",
              value: alertComment,
              onChanged: ((p0) {
                setState(() {
                  alertComment = !alertComment;
                });
              }),
            ),
            addVerticalSpacing(10),
            VWidgetsPrimaryButton(
              onPressed: () {},
              enableButton: true,
              buttonTitle: "Share",
            ),
            addVerticalSpacing(50),
          ],
        ),
      ),
    );
  }
}
