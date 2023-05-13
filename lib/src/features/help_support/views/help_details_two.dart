import 'package:flutter_html/flutter_html.dart';
import 'package:vmodel/src/features/help_support/widgets/help_point.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/vmodel.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

import '../../tutorials/models/tutorial_mock.dart';

class HelpDetailsViewTwo extends StatelessWidget {
  final String? tutorialDetailsTitle;
  final String? tutorialDetailsDescription;
  const HelpDetailsViewTwo({super.key, this.tutorialDetailsTitle, this.tutorialDetailsDescription});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const VWidgetsAppBar(
        leadingIcon: Padding(
          padding: EdgeInsets.only(top: 12),
          child: VWidgetsBackButton(),
        ),
        appbarTitle: "Help and support",
        appBarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const VWidgetsPagePadding.only(10, 10, 10),
          padding: const VWidgetsPagePadding.onlyTop(14),
          child:Column(
            children: [
              Text(
                tutorialDetailsTitle.toString(),
                style: theme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Theme.of(context).primaryColor),
              ),
              addVerticalSpacing(16),
              Html(
                data:tutorialDetailsDescription,
                style: {
                  "p": Style(
                    fontSize: FontSize(12.5.sp),
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                  "ol": Style(
                    fontSize: FontSize(12.5.sp),
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                },
              )
            ],
          )
        ),
      ),
    );
  }
}
