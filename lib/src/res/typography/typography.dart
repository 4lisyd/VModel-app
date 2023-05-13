import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vmodel/src/res/res.dart';

class VModelTypography1 {
  VModelTypography1._();
  static const String primaryfontName = "Avenir";
  static const String secondaryfontName = 'Futura';
  static TextStyle normalTextStyle = const TextStyle(
    fontFamily: primaryfontName,
    fontSize: 17,
  );
  static TextStyle mediumTextStyle = const TextStyle(
    fontFamily: primaryfontName,
    fontSize: 15.5,
  );
  static TextStyle smallTextStyle = const TextStyle(
    fontFamily: primaryfontName,
    fontSize: 14,
  );

  static const TextStyle labelTextStyle = TextStyle(
    fontFamily: VModelTypography1.primaryfontName,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle unselectedLabelTextStyle = TextStyle(
    fontFamily: VModelTypography1.primaryfontName,
    fontWeight: FontWeight.w400,
  );

  static TextStyle promptTextStyle = TextStyle(
    color: VmodelColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: VModelTypography1.primaryfontName,
  );

  static customWidthOpacityText(opacity, fontWeight) => TextStyle(
      fontFamily: VModelTypography1.primaryfontName,
      color: VmodelColors.mainColor.withOpacity(opacity),
      fontSize: 16,
      fontWeight: fontWeight);

  static TextStyle pageTitleTextStyle = TextStyle(
    fontFamily: 'Avenir',
    color: VmodelColors.text,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle sheetCenterCTA = const TextStyle(
    fontFamily: 'Avenir',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

const Size screenSize = Size(428, 926);
final TextStyle pageTitleTextStyle = TextStyle(
  fontFamily: VModelTypography1.primaryfontName,
  color: VmodelColors.text,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const TextStyle labelTextStyle = TextStyle(
  fontFamily: VModelTypography1.primaryfontName,
  fontWeight: FontWeight.w500,
);
const TextStyle unselectedLabelTextStyle = TextStyle(
  fontFamily: VModelTypography1.primaryfontName,
  fontWeight: FontWeight.w400,
);

final TextStyle promptTextStyle = TextStyle(
  color: VmodelColors.mainColor,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  fontFamily: VModelTypography1.primaryfontName,
);

final TextStyle buttonTitleTextStyle = TextStyle(
  color: VmodelColors.white,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  fontFamily: VModelTypography1.primaryfontName,
);

final TextStyle textFieldTitleTextStyle = TextStyle(
  color: VmodelColors.hintColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  fontFamily: VModelTypography1.primaryfontName,
);

final TextStyle datePickerTextStyle = TextStyle(
  color: VmodelColors.mainColor.withOpacity(0.2),
  fontWeight: FontWeight.w400,
  fontSize: 25,
  fontFamily: VModelTypography1.primaryfontName,
);

final TextStyle selectedDatePickerTextStyle = TextStyle(
  color: VmodelColors.mainColor,
  fontWeight: FontWeight.w500,
  fontSize: 25,
  fontFamily: VModelTypography1.primaryfontName,
);

customWidthOpacityText(opacity, fontWeight) => TextStyle(
    fontFamily: VModelTypography1.primaryfontName,
    color: VmodelColors.mainColor.withOpacity(opacity),
    fontSize: 16,
    fontWeight: fontWeight);

final TextStyle descriptionTextStyle = TextStyle(
  color: VmodelColors.mainColor,
  fontWeight: FontWeight.w500,
  fontSize: 14,
  fontFamily: 'Avenir',
);

const TextStyle bioTitleTextStyle = TextStyle(
  color: VmodelColors.appBarShadowColor,
  fontWeight: FontWeight.w500,
  fontSize: 15,
  fontFamily: VModelTypography1.secondaryfontName,
);
