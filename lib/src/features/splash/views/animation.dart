import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmodel/src/core/cache/local_storage.dart';
import 'package:vmodel/src/features/authentication/views/new_login_screens/sign_in.dart';
import 'package:vmodel/src/features/authentication/views/new_login_screens/sign_up.dart';
import 'package:vmodel/src/features/dashboard/dash/dashboard_ui.dart';
import 'package:vmodel/src/features/dashboard/feed/views/feed_home.dart';
import '../../../core/routing/navigator_1.0.dart';
import '../../../core/utils/shared.dart';
import '../../authentication/views/login_view.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  Offset logoOffset = const Offset(0, 0.2);
  double logoRotation =  -0.25;
  double logoScale =  0.8;
  Future<bool>checkString(key) async {
    Future<SharedPreferences> prefs1 = SharedPreferences.getInstance();
    final SharedPreferences prefs2 = await prefs1;
    bool res = prefs2.containsKey("$key");
    if (res == true) {
      navigateToRoute(context, const DashBoardView());
    } else {
      navigateToRoute(context, const LoginPage());
    }
    return res;
  }
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        logoOffset = const Offset(0, 0);
        logoRotation =0;
      });
    });
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        logoScale = 2.5;
      });
    });
    Future.delayed(const Duration(milliseconds: 3500), () {
      checkString('token');

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSlide(
        curve: Curves.ease,
        offset: logoOffset,
        duration: const Duration(milliseconds: 1500),
        child: AnimatedRotation(
          curve: Curves.ease,
          turns: logoRotation,
          duration: const Duration(milliseconds: 1500),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 3200),
            scale: logoScale,
            curve: Curves.easeInOutCubic,
            child: Image.asset(
              VmodelAssets1.logo,
              height: 216,
              width: 216,
            ),
          ),
        ),
      ),
    );
  }
}
