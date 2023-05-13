import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/shimmer/profile_shimmer.dart';
import 'package:vmodel/src/vmodel.dart';

class ProfileShimmerPage extends StatelessWidget {
  const ProfileShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VWidgetsAppBar(
        appbarTitle: 'Profile Shimmer',
        leadingIcon:  VWidgetsBackButton(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          profileShimmer(context),
          addVerticalSpacing(20),
          
        ],
      )),
    );
  }
}
