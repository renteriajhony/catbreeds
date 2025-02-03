import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection.dart';
import '../../domain/entities/cat.dart';
import '../../domain/usecases/get_cats.dart';

final catProvider = FutureProvider<List<Cat>>((ref) async {
  final getCats = ref.watch(getCatsUseCaseProvider);
  final result = await getCats(NoParams());
  return result.fold((failure) => [], (cats) => cats);
});

final catFilterProvider =
    FutureProvider.autoDispose.family<List<Cat>, String>((ref, query) async {
  final getCatsFIlter = ref.watch(getCatsFilterUseCaseProvider);
  final result = await getCatsFIlter(query);
  return result.fold((failure) => [], (cats) => cats);
});
