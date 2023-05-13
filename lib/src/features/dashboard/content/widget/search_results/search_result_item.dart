import 'package:flutter/material.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
           const RenderSvgWithoutColor(
            svgPath: VIcons.searchNormalWhite,
            svgHeight: 20,
            svgWidth: 20,
            ),
            vmSizedW(10),
            Text(text, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500, color: VmodelColors.white
            ),)
          ],
        ),

        Divider(color:  VmodelColors.white.withOpacity(0.15), height: 25,),
      ],
    );
  }
}
