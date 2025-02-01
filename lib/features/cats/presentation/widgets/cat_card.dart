import 'package:flutter/material.dart';
import '../../domain/entities/cat.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(cat.name),
          subtitle: Text(cat.description ?? ''),
        ),
        Text(cat.temperament ?? '')
      ],
    );
  }
}
