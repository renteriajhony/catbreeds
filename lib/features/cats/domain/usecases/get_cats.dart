import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// [GetCats] Resuelve el caso de uso de traer la informacion de los gatos del api.
class GetCats extends UseCase<List<Cat>, NoParams> {
  final CatRepository repository;

  GetCats(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) {
    return repository.getCats();
  }
}

class NoParams {}