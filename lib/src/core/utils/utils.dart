import 'package:flutter/material.dart';
export 'size_config.dart';

Widget vmSizedH(double height) => SizedBox(
      height: height,
    );

Widget vmSizedW(double width) => SizedBox(
      width: width,
    );

Widget vmSpacer() => const Spacer();
