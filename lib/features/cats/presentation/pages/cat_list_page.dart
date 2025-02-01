import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/cat_provider.dart';
import '../widgets/cat_card.dart';

class CatListPage extends ConsumerWidget {
  const CatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catkList = ref.watch(catProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gatos'),
        centerTitle: true,
      ),
      body: catkList.when(
        data: (cats) {
          log('${cats.length}', name: 'TOTAL Gatos');
          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) => CatCard(cat: cats[index]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error al cargar los catos')),
      ),
    );
  }
}
