import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsAddAlbumPopUp extends StatelessWidget {
  final String? buttonTitle;
  final String? popupTitle;
  final VoidCallback? onPressed;

  const VWidgetsAddAlbumPopUp(
      {this.buttonTitle, this.popupTitle, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Center(
        child: Text(popupTitle ?? "",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                )),
      ),
      titleTextStyle: Theme.of(context).textTheme.headline1,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const VWidgetsPrimaryTextFieldWithTitle(
            label: "Add name :",
            hintText: "Ex. Commercial",
            //validator: ValidationsMixin.isNotEmpty(value),
            //controller: ,
            //onSaved: (){},
          ),
          addVerticalSpacing(20),
          Center(
            child: VWidgetsPrimaryButton(
              butttonWidth: MediaQuery.of(context).size.width / 1.8,
              onPressed: onPressed,
              enableButton: true,
              buttonTitle: buttonTitle,
            ),
          ),
        ],
      ),
    );
  }
}
