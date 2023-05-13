import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

import '../models/discover_item.dart';

class TapAndHold extends StatelessWidget {
  final DiscoverItemObject item;
  const TapAndHold({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 180),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(item.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 1],
                colors: [Colors.transparent, Colors.black87])),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    RenderSvgWithColor2(
                      svgPath: VIcons.star,
                      color: VmodelColors.white,
                    ),
                    vmSizedW(4),
                    Text(
                      item.points,
                      style: textTheme.displaySmall?.copyWith(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            vmSizedH(4),
            Text(
              item.categories,
              style: textTheme.displaySmall?.copyWith(color: Colors.white),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                renderProperty(item.age, 'Age', textTheme),
                renderProperty(item.age, 'Height', textTheme),
                renderProperty(item.age, 'Brith Gender', textTheme),
                renderProperty(item.age, 'Ethnicity', textTheme),
                renderProperty(item.age, 'Hair', textTheme),
              ],
            ),
            vmSizedH(12),
            Text(
              item.description,
              style: textTheme.displaySmall
                  ?.copyWith(fontSize: 11, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget renderProperty(String value, String field, TextTheme theme) {
    return Column(
      children: [
        Text(
          value,
          style: theme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
        ),
        Text(
          field,
          style: theme.displayLarge?.copyWith(color: Colors.white, fontSize: 10),
        )
      ],
    );
  }
}
