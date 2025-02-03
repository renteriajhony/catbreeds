///[NotResource] Widget que representa la aucenca de algu recurso, solicitud de datos, imagenes.
import 'package:flutter/material.dart';

import '../utils/tokens/tokens.dart';

class NotResource extends StatelessWidget {
  const NotResource({
    super.key,
    required this.label,
    this.textStyle,
  });
  final String label;
  final TextStyle? textStyle;
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
