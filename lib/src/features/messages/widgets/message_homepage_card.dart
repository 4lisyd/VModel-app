import 'package:vmodel/src/features/messages/widgets/message_card_circular_avatar.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsMessageCard extends StatelessWidget {
  final String? titleText;
  final String? starRating;
  final String? profileImage;
  final String? latestMessage;
  final String? latestMessageTime;
  final VoidCallback? onPressedLike;
  final VoidCallback? onTapCard;
  final bool isLiked;

  const VWidgetsMessageCard(
      {required this.titleText,
      required this.starRating,
      required this.profileImage,
      this.latestMessage,
      this.latestMessageTime,
      this.onPressedLike,
      required this.onTapCard,
      
      super.key, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTapCard,
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: VWidgetsMessageProfileAvatar(
                      imagePath: "assets/images/models/listTile_3.png",
                      imageHeight: 60,
                      imageWidth: 60,
                    ),
                  ),
                  addHorizontalSpacing(10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleText!,
                              style: VModelTypography1.normalTextStyle.copyWith(
                                color: VmodelColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                            addHorizontalSpacing(10),
                            Text(
                              starRating!,
                              style: VModelTypography1.normalTextStyle.copyWith(
                                color: VmodelColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                            //Not used VIcons here because its not matching the figma UI
                            const Icon(
                              Icons.star_rounded,
                              color: VmodelColors.primaryColor,
                              size: 16,
                            )
                          ],
                        ),
                        addVerticalSpacing(4),
                        //second row
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              latestMessage!,
                              style: VModelTypography1.normalTextStyle.copyWith(
                                color:
                                    Theme.of(context).primaryColor.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ),
                            addHorizontalSpacing(10),
                            Text(
                              latestMessageTime!,
                              style: VModelTypography1.normalTextStyle.copyWith(
                                color:
                                    Theme.of(context).primaryColor.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 9.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  
                 
                ],
              ),
            
          ),
        ),
         IconButton(
              onPressed: onPressedLike,
              //! change the icon to vicons
              icon:  RenderSvg(
                svgPath: isLiked ? VIcons.unlikedIcon : VIcons.likedIcon,
                svgHeight: 20,
                svgWidth: 20,
              ),
            ),
      ],
    );
  }
}
