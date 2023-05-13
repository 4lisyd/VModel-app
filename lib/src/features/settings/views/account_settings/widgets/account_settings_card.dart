import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';



class VWidgetsAccountSettingsCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? subtitle;
  const VWidgetsAccountSettingsCard({
    required this.title,
    this.subtitle,
    required this.onTap, 
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            addHorizontalSpacing(4),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor.withOpacity(0.5)),
            ),
            const Divider(
              thickness: 0.5,
            ),
          ],
        ),
      ),
    ); 
  }
}