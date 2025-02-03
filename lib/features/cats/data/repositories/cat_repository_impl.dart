import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// \[CatRepositoryImpl\] Implementación del repositorio de gatos.
///
/// Este repositorio se encarga de manejar la lógica de negocio relacionada
/// con la obtención de datos de gatos, utilizando una fuente de datos remota.
class CatRepositoryImpl implements CatRepository {
  /// Constructor de \[CatRepositoryImpl\].
  ///
  /// \[remoteDataSource\]: Fuente de datos remota para obtener los datos de los gatos.
  CatRepositoryImpl({required this.remoteDataSource});

  /// Fuente de datos remota para obtener los datos de los gatos.
  final CatRemoteDataSource remoteDataSource;

  /// Obtiene una lista de gatos.
  ///
  /// Retorna un \[Either\] que contiene una lista de \[Cat\] en caso de éxito
  /// o un \[Failure\] en caso de error.
  @override
  Future<Either<Failure, List<Cat>>> getCats() async {
    try {
      final cats = await remoteDataSource.getCats();
      return Right(cats);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  /// Obtiene una lista de gatos filtrados según un criterio de búsqueda.
  ///
  /// \[filter\]: Criterio de búsqueda para filtrar los gatos.
  /// Retorna un \[Either\] que contiene una lista de \[Cat\] en caso de éxito
  /// o un \[Failure\] en caso de error.
  @override
  Future<Either<Failure, List<Cat>>> getCatsFilter(String filter) async {
    try {
      final cats = await remoteDataSource.getCatsFilter(filter);
      return Right(cats);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}