import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../lib.dart';

/// [FutureProvider:catProvider] Maneja el estado de consulta de gatos
final catProvider = FutureProvider<List<Cat>>((ref) async {
  final getCats = ref.watch(getCatsUseCaseProvider);
  final result = await getCats(NoParams());
  return result.fold((failure) => [], (cats) => cats);
});

/// [FutureProvider:catFilterProvider] Maneja el estado de consulta de gatos. segun filtro de busqueda
final catFilterProvider =
    FutureProvider.autoDispose.family<List<Cat>, String>((ref, query) async {
  final getCatsFIlter = ref.watch(getCatsFilterUseCaseProvider);
  final result = await getCatsFIlter(query);
  return result.fold((failure) => [], (cats) => cats);
});
