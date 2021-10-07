import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  // static late double _safeAreaHorizontal;
  // static late double _safeAreaVertical;
  static late double paddingTop;
  static late double paddingBottom;
  static late double _scaleText;
  // static double safeBlockHorizontal;
  // static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    // Width and Height
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    // 360x792 is width from figma design you can use 100 for 100% scaling.
    blockSizeHorizontal = screenWidth / 360;
    blockSizeVertical = screenHeight / 792;
    _scaleText = (blockSizeVertical < blockSizeHorizontal)
        ? blockSizeVertical
        : blockSizeHorizontal;
    // print(
    //     'Width: ($screenWidth)$blockSizeHorizontal\nHeight: ($screenHeight)$blockSizeVertical\nTxt: $_scaleText');

    // Padding
    paddingTop = _mediaQueryData.padding.top; // For status bar
    paddingBottom = _mediaQueryData.padding.bottom; // For keyboard dll

    // Safe Area
    // _safeAreaHorizontal =
    //     _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    // _safeAreaVertical =
    //     _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    // safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    // safeBlockVertical = (screenHeight - paddingTop) / 100;
  }

  /// Calculates the height depending on the device's screen siz
  static double scaleHeight(double pixel) => blockSizeVertical * pixel;

  /// Calculates the width depending on the device's screen size
  static double scaleWidth(double pixel) => blockSizeHorizontal * pixel;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  static double scaleText(double pixel) => _scaleText * pixel;
}
