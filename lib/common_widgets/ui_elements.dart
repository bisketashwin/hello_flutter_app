import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../views/assets.dart';

Widget reciptBt44() {
  return Column(
    children: [
      SvgPicture.asset(
        'assets/svg/receipt_long.svg',
        height: 44,
        width: 44,
      ),
      const Text('Reciepts'),
    ],
  );
}

Widget svgButton({
  required String svgName,
  required int svgSize,
  String? labelText,
  int? labelSize,
}) {
  final TextStyle myTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: labelSize?.toDouble(),
  );

  return Column(
    children: [
      SvgPicture.asset(
        svgAssets[svgName] ?? '',
        height: svgSize.toDouble(),
        width: svgSize.toDouble(),
      ),
      Text(
        labelText!,
        style: myTextStyle,
      ),
    ],
  );
}
