import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/shimmer/discover_shimmer.dart';
import 'package:vmodel/src/vmodel.dart';

class DiscoverShimmerPage extends StatelessWidget {
  const DiscoverShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        appbarTitle: 'Discover Shimmer',
        leadingIcon: const VWidgetsBackButton(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          discoverShimmer(context),
        ],
      )),
    );
  }
}
