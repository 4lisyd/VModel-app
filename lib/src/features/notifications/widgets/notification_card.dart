import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsNotificationCard extends StatelessWidget {
  final String? profileImagePath;
  final String? notificationText;
  final String? notificationType;
  const VWidgetsNotificationCard({
    required this.profileImagePath,
    required this.notificationText,
  required this.notificationType,
    super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
                children: [
                  Padding(
                    padding: const VWidgetsPagePadding.verticalSymmetric(8),
                    child: Container(
                      decoration: VModelBoxDecoration.avatarDecoration.copyWith(
                          color: VmodelColors.appBarBackgroundColor,
                        border: Border.all(width: 0, color: Colors.transparent),
                          image: DecorationImage(
                            image: AssetImage(
                              profileImagePath!,
                              //e.picPath,
                            ),
                            fit: BoxFit.cover,
                          )),
                      width: 50,
                      height: 50,
                    ),
                  ),
                  addHorizontalSpacing(12),


                  Flexible(child: Row(
                    children: [
                      Flexible(child: Text(notificationText!, style: VModelTypography1.normalTextStyle.copyWith(
                        color: VmodelColors.primaryColor.withOpacity(1),
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                      ), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ),

                      vmSizedW(5),
                      Text("3d", style: VModelTypography1.normalTextStyle.copyWith(
                        color: VmodelColors.primaryColor.withOpacity(0.2),
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp, ), maxLines: 1,),
                    ],
                  ),),

                ],
            ),
          ),
        ),


        notificationType == "liked" ?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profileImagePath!),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            )

            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 95,
            height: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: notificationType == "accept" ? VmodelColors.primaryColor : VmodelColors.white,
              border: Border.all(width: 1.5, color: VmodelColors.primaryColor)
            ),
            child: Center(
              child: Text(notificationType == "accept" ? "Accept" : "Accepted",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: notificationType == "accepted" ? VmodelColors.primaryColor : VmodelColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),),
            ),
          ),
        ),
      ],
    );
  }
}
