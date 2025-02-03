import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// \[CatRepository\] Define las operaciones para obtener datos de gatos.
///
/// Esta interfaz declara los métodos necesarios para interactuar con
/// el repositorio de datos de gatos, permitiendo obtener listas de gatos
/// y listas de gatos filtrados según un criterio de búsqueda.
abstract class CatRepository {
  /// Obtiene una lista de gatos.
  ///
  /// Retorna un \[Either\] que contiene una lista de \[Cat\] en caso de éxito
  /// o un \[Failure\] en caso de error.
  Future<Either<Failure, List<Cat>>> getCats();

  /// Obtiene una lista de gatos filtrados según un criterio de búsqueda.
  ///
  /// \[filter\]: Criterio de búsqueda para filtrar los gatos.
  /// Retorna un \[Either\] que contiene una lista de \[Cat\] en caso de éxito
  /// o un \[Failure\] en caso de error.
  Future<Either<Failure, List<Cat>>> getCatsFilter(String filter);
}