import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/tokens/tokens.dart';
import '../../domain/entities/cat.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Hero(
            tag: "cat-${cat.id}",
            child: Text(
              cat.name,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: "cat-${cat.referenceImageId}",
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.45,
              // height: double.infinity,
              imageUrl:
                  'https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg',
              progressIndicatorBuilder: (_, child, loadingProgress) {
                return Center(
                  child: Image.asset(
                    'assets/images/cat-lame.gif',
                    width: double.infinity,
                    height: 50,
                  ),
                );
              },
              errorWidget: (context, error, stackTrace) => Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cat-not-like.png',
                    width: double.infinity,
                    height: 200,
                  ),
                  Text(
                    'Sin Imagen',
                    style: TextStyle(
                      fontSize: DimensionsDouble.twentyFive,
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ))
        ],
      ),
    );
  }
}
