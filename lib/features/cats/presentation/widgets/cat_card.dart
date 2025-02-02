import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/core/utils/tokens/dimensions.dart';
import 'package:catbreeds/features/cats/presentation/pages/cat_detail_page.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/cat.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DimensionsDouble.fourteen,
          vertical: DimensionsDouble.ten),
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionsDouble.fourteen,
                vertical: DimensionsDouble.ten,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Hero(
                      tag: "cat-${cat.id}",
                      child: Text(
                        cat.name,
                        style: TextStyle(color:Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                  FadeInRight(
                    duration: Duration(seconds: 1),
                    delay: Duration(milliseconds: 500),
                    from: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CatDetailPage(
                            cat: cat,
                          ),
                        ),
                      ),
                      child: Text(
                        'Mas...',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: DimensionsDouble.sixteen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: 400,
                maxHeight: 400,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionsDouble.fourteen,
              ),
              child: Hero(
                tag: "cat-${cat.referenceImageId}",
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  // width: double.infinity,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionsDouble.fourteen,
                vertical: DimensionsDouble.ten,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(cat.origin ?? ''), Text('${cat.intelligence}')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
