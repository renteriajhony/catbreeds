import 'package:catbreeds/features/cats/domain/usecases/get_cats_filter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/cats/data/datasources/cat_remote_data_source.dart';
import 'features/cats/data/repositories/cat_repository_impl.dart';
import 'features/cats/domain/usecases/get_cats.dart';


final dioProvider = Provider((ref) => Dio());


final catRemoteDataSourceProvider = Provider(
      (ref) => CatRemoteDataSourceImpl(dio: ref.read(dioProvider)),
);

final catRepositoryProvider = Provider(
      (ref) => CatRepositoryImpl(remoteDataSource: ref.read(catRemoteDataSourceProvider)),
);

final getCatsUseCaseProvider = Provider(
      (ref) => GetCats(ref.read(catRepositoryProvider)),
);

final getCatsFilterUseCaseProvider = Provider(
      (ref) => GetCatsFIlter(ref.read(catRepositoryProvider)),
);