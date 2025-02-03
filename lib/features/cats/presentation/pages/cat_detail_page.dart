import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../lib.dart';



class CatDetailPage extends StatelessWidget {
  CatDetailPage({super.key, required this.cat});

  final Cat cat;
  final String imageCatBaseUrl = dotenv.get('CAT_IMAGE_BASE_URL');

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);
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
                  '$imageCatBaseUrl${cat.referenceImageId}.jpg',
              progressIndicatorBuilder: (_, child, loadingProgress) {
                return Center(
                  child: Image.asset(
                    'assets/images/cat-lame.gif',
                    width: double.infinity,
                    height: DimensionsDouble.fifty,
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
                      height: DimensionsDouble.twoHundred,
                    ),
                    Text(
                      localizations?.appNotImage ?? '',
                      style: TextStyle(
                        fontSize: DimensionsDouble.twentyFive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(DimensionsDouble.twentyTwo),
              children: [
                RichText(
                  text: TextSpan(
                    text: localizations?.catDetailPageLabelDescription ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    children: [
                      TextSpan(
                        text: '${cat.description}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: localizations?.catDetailPageLabelCountry ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    children: [
                      TextSpan(
                        text: '(${cat.countryCode}) ${cat.origin}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: localizations?.catDetailPageLabelIntelligence ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    children: [
                      TextSpan(
                        text: '${cat.intelligence}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: localizations?.catDetailPageLabelAdaptability ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    children: [
                      TextSpan(
                        text: '${cat.adaptability}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: localizations?.catDetailPageLabelLifeSpan ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    children: [
                      TextSpan(
                        text: '${cat.lifeSpan} ${(localizations?.years ?? '')}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: localizations?.catDetailPageLabelBreed ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    children: [
                      TextSpan(
                        text: cat.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
