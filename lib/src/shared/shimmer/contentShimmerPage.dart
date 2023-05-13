
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/shimmer/content_shimmer.dart';
import 'package:vmodel/src/vmodel.dart';

class ContentShimmerPage extends StatelessWidget {
  const ContentShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const VWidgetsAppBar(
        appbarTitle: 'Content Shimmer',
        leadingIcon: const VWidgetsBackButton(),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
contentShimmer(context),
addVerticalSpacing(25),
        ],
      ),
    );
  }
}