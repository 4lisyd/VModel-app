import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/features/splash/views/new_splash.dart';
import 'src/res/res.dart';
import 'src/vmodel.dart';

void main() async {
  //removes the native white splashscreen that comes with the flutter sdk [a better way than tweaking the AndroidManifest file]
  WidgetsBinding widgetFlutterBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetFlutterBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(375, 812));
    await DesktopWindow.setMinWindowSize(const Size(375, 812));
    await DesktopWindow.setMaxWindowSize(const Size(375, 812));
  }
  runApp(const ProviderScope(child: VAppProduction()));
}

class VAppProduction extends StatelessWidget {
  const VAppProduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            title: VMstring.appName,
            theme: VModelTheme.lightMode,
            home: const NewSplash(),
          );
        });
      });
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
