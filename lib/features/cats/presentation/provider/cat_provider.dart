import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection.dart';
import '../../domain/entities/cat.dart';
import '../../domain/usecases/get_cats.dart';

final catProvider = FutureProvider<List<Cat>>((ref) async {
  final getCats = ref.watch(getCatsUseCaseProvider);
  final result = await getCats(NoParams());
  return result.fold((failure) => [], (cats) => cats);
});
