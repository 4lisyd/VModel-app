import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/shimmer/feed_shimmer.dart';
import 'package:vmodel/src/vmodel.dart';

class FeedShimmerPage extends StatelessWidget {
  const FeedShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        appbarTitle: 'Feed Shimmer',
        leadingIcon:  VWidgetsBackButton(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          feedShimmer(context),
          addVerticalSpacing(20),
          feedShimmer(context),
        ],
      )),
    );
  }
}
