import 'package:dartz/dartz.dart';

import '../../../../lib.dart';


/// [CatRepository] Representacion de encapsulacion acceso a datos modulo cat
abstract class CatRepository {
  /// Llamado de todos los datos
  Future<Either<Failure, List<Cat>>> getCats();
  /// Llamado de datos segun filtro de busqueda
  Future<Either<Failure, List<Cat>>> getCatsFilter(String filter);
}