import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// [GetCatsFIlter] Resuelve el caso de uso de busqueda de gatos con filtro
class GetCatsFIlter extends UseCase<List<Cat>, String> {
  final CatRepository repository;

  GetCatsFIlter(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(String params) {
    return repository.getCatsFilter(params);
  }
}
