import 'package:dartz/dartz.dart';

import '../../../../lib.dart';


class GetCatsFIlter extends UseCase<List<Cat>, String> {
  final CatRepository repository;

  GetCatsFIlter(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(String params) {
    return repository.getCatsFilter(params);
  }
}
