import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vmodel/src/res/res.dart';

//a reusable widget to render svg which would help to in optimzing and reducing app size   rather than images
class RenderSvg extends StatelessWidget {
  final String svgPath;
  final double? svgHeight;
  final double? svgWidth;
  final Color? color;
  const RenderSvg(
      {super.key,
      required this.svgPath,
      this.svgHeight,
      this.svgWidth,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: svgHeight ?? 24,
      width: svgWidth ?? 24,
      color: color ?? VmodelColors.primaryColor,
    );
  }
}

//a reusable widget to render svg which would help to in optimzing and reducing app size   rather than images
class RenderSvgWithoutColor extends StatelessWidget {
  final String svgPath;
  final double? svgHeight;
  final double? svgWidth;

  const RenderSvgWithoutColor({
    super.key,
    required this.svgPath,
    this.svgHeight,
    this.svgWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: svgHeight ?? 24,
      width: svgWidth ?? 24,
    );
  }
}

class NormalRenderSvgWithColor extends StatelessWidget {
  final String svgPath;
  final Color? color;
  const NormalRenderSvgWithColor({
    super.key,
    this.color,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      // color: color ?? Theme.of(context).primaryColor,
    );
  }
}




class NormalRenderSvg extends StatelessWidget {
  final String svgPath;
  const NormalRenderSvg({
    super.key,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
    );
  }
}


class RenderSvgWithColor2 extends StatelessWidget {
  final String svgPath;
  final Color? color;
  const RenderSvgWithColor2({
    super.key,
    this.color,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      color: color ?? Theme.of(context).primaryColor,
    );
  }
}
