import 'package:flutter/material.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/core/utils/shared.dart';

class FeedFirstRowIcons extends StatelessWidget {
  final VoidCallback shareFunction;
  final VoidCallback saved;
  final String? saveAmount;
  final bool? savedBool;
  final List<dynamic>? imageList;
  const FeedFirstRowIcons({
    Key? key,
    this.imageList,
    required this.saved,
    required this.shareFunction,
    this.savedBool = false,
    this.saveAmount,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                shareFunction();
              },
              child:  RenderSvg(
                svgPath: VIcons.shareIcon,
                svgHeight: 23,
                svgWidth: 23,
                // color: Color(0xff543B3A),
                color: Colors.brown.shade900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                saveAmount ?? '300',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: VmodelColors.primaryColor),
              ),
            ),
          ],
        ),
        vmSizedW(20),
        GestureDetector(
            onTap: () {
              saved();
            },
            child: RenderSvgWithoutColor(
              svgPath:
                  savedBool! ? VIcons.savedPostIcon : VIcons.unsavedPostsIcon,
            ))
      ],
    );
  }
}

class FeedSecondRowIcons extends StatelessWidget {
  final VoidCallback send;
  final VoidCallback like;
  final bool? likedBool;
  final String? likeAmount;
  const FeedSecondRowIcons({
    super.key,
    required this.send,
    required this.like,
    this.likedBool = false,
    this.likeAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              send();
            },
            child: const RenderSvg(
              svgPath: VIcons.sendWitoutNot,
              svgHeight: 28,
              svgWidth: 28,
            )),
        vmSizedW(20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                like();
              },
              child: RenderSvg(
                svgPath: likedBool! ? VIcons.likedIcon : VIcons.unlikedIcon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                likeAmount ?? '50.4k',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: VmodelColors.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
