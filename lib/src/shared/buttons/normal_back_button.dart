import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsBackButton extends StatelessWidget {
  final Color? buttonColor;
  const VWidgetsBackButton({super.key, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => goBack(context),
      icon: const RotatedBox(
        quarterTurns: 2,
        child: RenderSvg(
          svgPath: VIcons.forwardIcon,
          svgWidth: 13,
          svgHeight: 13,
        ),
      ),
    );
  }
}
