import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// Esta clase implementa el caso de uso para obtener una lista filtrada de gatos
/// desde el repositorio de datos.
///
/// \[repository\]: Instancia del repositorio de gatos.
///
/// Métodos:
/// - \[call\]: Ejecuta el caso de uso para obtener la lista filtrada de gatos.
class GetCatsFilter extends UseCase<List<Cat>, String> {
  final CatRepository repository;

  GetCatsFilter(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(String params) {
    return repository.getCatsFilter(params);
  }
}
