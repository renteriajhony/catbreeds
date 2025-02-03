import 'package:flutter/material.dart';

import '../utils/tokens/tokens.dart';

class NotResource extends StatelessWidget {
  NotResource({
    super.key,
    required this.label,
    this.textStyle,
  });
  String label;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/cat-not-like.png',
          width: double.infinity,
          height: DimensionsDouble.twoHundred,
        ),
        Text(
          label,
          style: textStyle,
        ),
      ],
    );
  }
}
