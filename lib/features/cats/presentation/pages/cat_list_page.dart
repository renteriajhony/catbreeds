import 'package:catbreeds/core/utils/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/cat_provider.dart';
import '../widgets/cat_card.dart';
import '../widgets/custom_search_bar.dart';

class CatListPage extends ConsumerWidget {
  const CatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catkList = ref.watch(catProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: DimensionsDouble.ten),
              child: CustomSearchBar(
                  // mainProvider: mainProvider,
                  ),
            ),
            Expanded(
              child: catkList.when(
                data: (cats) {
                  return ListView.builder(
                    itemCount: cats.length,
                    itemBuilder: (context, index) => CatCard(cat: cats[index]),
                  );
                },
                loading: () => Center(
                  child: Image.asset(
                    'assets/images/cat-louder.gif',
                    width: double.infinity,
                    height: 80,
                  ),
                ),
                error: (error, _) =>
                    Center(child: Text('Error al cargar los catos')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
