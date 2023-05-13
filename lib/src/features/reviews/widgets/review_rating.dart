import 'package:flutter/material.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';

class ReviewRatings extends StatelessWidget {
  const ReviewRatings({Key? key, required this.rating, required this.title})
      : super(key: key);

  final String rating;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rating,
             style:Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: VmodelColors.primaryColor
                        ),
                        ),
                        const RenderSvg(
                          svgPath: VIcons.star,
                          svgHeight: 20,
                          svgWidth: 20,
                          color: VmodelColors.primaryColor,
                          ),
          ],
        ),
        vmSizedH(4),
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: VmodelColors.primaryColor),
        ),
      ],
    );
  }
}
