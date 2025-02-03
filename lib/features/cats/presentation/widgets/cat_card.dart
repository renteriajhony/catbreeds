import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/core/utils/tokens/dimensions.dart';
import 'package:catbreeds/features/cats/presentation/pages/cat_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../core/widgets/not_resource.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/cat.dart';

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
                  imageUrl: '$imageCatBaseUrl${cat.referenceImageId}.jpg',
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
