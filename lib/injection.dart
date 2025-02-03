import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/cats/cats.dart';



/// Proveedor de `Dio` para realizar solicitudes HTTP.
final dioProvider = Provider((ref) => Dio());

/// Proveedor de `CatRemoteDataSourceImpl` que utiliza `Dio` para obtener datos remotos.
final catRemoteDataSourceProvider = Provider(
      (ref) => CatRemoteDataSourceImpl(dio: ref.read(dioProvider)),
);

/// Proveedor de `CatRepositoryImpl` que utiliza `CatRemoteDataSourceImpl` para acceder a los datos.
 final catRepositoryProvider = Provider(
      (ref) => CatRepositoryImpl(remoteDataSource: ref.read(catRemoteDataSourceProvider)),
);
/// Proveedor de `GetCats` que utiliza `CatRepositoryImpl` para obtener una lista de gatos.
final getCatsUseCaseProvider = Provider(
      (ref) => GetCats(ref.read(catRepositoryProvider)),
);
/// Proveedor de `GetCatsFilter` que utiliza `CatRepositoryImpl` para obtener una lista filtrada de gatos.
final getCatsFilterUseCaseProvider = Provider(
      (ref) => GetCatsFilter(ref.read(catRepositoryProvider)),
);