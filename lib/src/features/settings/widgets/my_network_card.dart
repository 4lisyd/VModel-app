import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsNetworkPageCard extends StatelessWidget {
  final String? userName;
  final String? userNickName;
  final String? userImage;
  final VoidCallback? onPressedRemove;
  final VoidCallback? onPressedProfile;

  const VWidgetsNetworkPageCard(
      {required this.userName,
      required this.userNickName,
      required this.userImage,
      required this.onPressedRemove,
      required this.onPressedProfile,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onPressedProfile,
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: VmodelColors.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: AssetImage(userImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  addHorizontalSpacing(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userNickName!,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                                fontSize: 12.sp),
                      ),
                      addVerticalSpacing(2),
                      Text(
                        userName!,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                                fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            OutlinedButton(
                onPressed: onPressedRemove,
                style: OutlinedButton.styleFrom(
                  
                  side: const BorderSide(
                      color: VmodelColors.primaryColor,
                      width: 1.5), //<-- SEE HERE
                ),
                child: Text(
                  "Remove",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                      fontSize: 11.sp),
                )),
          ],
        ),
        addVerticalSpacing(15),
      ],
    );
  }
}
