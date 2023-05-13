import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsSenderTextCard extends StatelessWidget {
  final String? senderMessage;
  final String? senderImage;

  const VWidgetsSenderTextCard(
      {required this.senderMessage, required this.senderImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const VWidgetsPagePadding.verticalSymmetric(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Sender Profile
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: VmodelColors.primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(
                image: AssetImage(senderImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          addHorizontalSpacing(10),
          //Sender Text
          Flexible(
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.7),
              decoration: BoxDecoration(
                border: Border.all(color: VmodelColors.greyColor),
                borderRadius: BorderRadius.circular(8),
                color: VmodelColors.appBarBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
                child: Text(
                  senderMessage!,
                  maxLines: null,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                        fontSize: 16,
                    fontWeight: FontWeight.w500,
                  
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
