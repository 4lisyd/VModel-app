import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';
import '../models/discover_item.dart';

class DiscoverSubItem extends StatelessWidget {
  final DiscoverItemObject item;
  final VoidCallback? onTap;
  final bool isViewAll;
  final VoidCallback? onLongPress;
  const DiscoverSubItem({
    Key? key,
    required this.item,
    required this.onTap,
    required this.onLongPress,
    this.isViewAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 180,
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: isViewAll ? 0 : 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isViewAll ? 0 : 8),
        image:
            DecorationImage(image: AssetImage(item.image), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        onLongPress: () {
          onLongPress!();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isViewAll ? 0 : 8),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [Colors.transparent, Colors.black87])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      style: textTheme.displayLarge?.copyWith(
                          fontSize: 13.sp,
                          color: VmodelColors.white,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                        style: textTheme.displaySmall?.copyWith(
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              vmSizedH(3),
              Text(
                item.categories,
                style: textTheme.displaySmall
                    ?.copyWith(fontSize: 8.sp, color: VmodelColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
