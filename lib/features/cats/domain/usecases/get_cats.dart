import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// Esta clase implementa el caso de uso para obtener una lista de gatos
/// desde el repositorio de datos.
///
/// \[repository\]: Instancia del repositorio de gatos.
///
/// Métodos:
/// - \[call\]: Ejecuta el caso de uso para obtener la lista de gatos.
class GetCats extends UseCase<List<Cat>, NoParams> {
  final CatRepository repository;

  GetCats(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) {
    return repository.getCats();
  }
}

class NoParams {}