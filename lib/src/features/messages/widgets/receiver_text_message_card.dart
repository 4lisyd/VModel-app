import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsReceiverTextCard extends StatelessWidget {
  final String? receiverMessage;

  const VWidgetsReceiverTextCard({required this.receiverMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const VWidgetsPagePadding.verticalSymmetric(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: SizeConfig.screenWidth * 0.75,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: VmodelColors.greyColor.withOpacity(0.25),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
                child: Text(
                  receiverMessage!,
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
