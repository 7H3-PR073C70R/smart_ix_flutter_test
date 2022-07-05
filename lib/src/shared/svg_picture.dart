import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureAsset extends StatelessWidget {
  const SvgPictureAsset({super.key, required this.assetName, this.color});

  final String assetName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      color: color,
    );
  }
}
