

import 'dart:ui';

class ColorConfig{

  static final primaryColor = HexColor('#188E98');
  static final blackColor = HexColor('#000000');
  static final whiteColor = HexColor('#FFFFFF');
  static final greyColor = HexColor('#1B1B1B');
  static final lightGreyColor = HexColor('#E4E2E5');

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}