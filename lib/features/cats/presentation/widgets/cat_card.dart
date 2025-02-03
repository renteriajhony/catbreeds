import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../lib.dart';


class CatCard extends StatelessWidget {
  CatCard({super.key, required this.cat});

  final Cat cat;
  final String imageCatBaseUrl = dotenv.get('CAT_IMAGE_BASE_URL');

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);
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
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  FadeInRight(
                    duration: Duration(seconds: DimensionsInt.one),
                    delay: Duration(milliseconds: DimensionsInt.fiveHundred),
                    from: DimensionsDouble.twenty,
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
                        localizations?.cardLabelLink ?? '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: DimensionsDouble.fourHundred,
                maxHeight: DimensionsDouble.fourHundred,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionsDouble.fourteen,
              ),
              child: Hero(
                tag: "cat-${cat.referenceImageId}",
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '$imageCatBaseUrl${cat.referenceImageId}.jpg',
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
                    child: NotResource(
                      label: localizations?.appNotImage ?? '',
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
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
                children: [
                  Text(
                    cat.origin ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '${localizations?.cardLabelIntelligence ?? ''}${cat.intelligence}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
