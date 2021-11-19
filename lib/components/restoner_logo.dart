import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestonerLogo extends StatelessWidget {
  const RestonerLogo({Key? key, this.size = 35.0, this.onlyIso = false, this.isWhite = false}) : super(key: key);

  final double size;
  final bool onlyIso;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/restoner/restoner-${onlyIso ? 'iso' : 'logo'}${isWhite ? '-white' : ''}.svg",
      height: size,
    );
  }
}
