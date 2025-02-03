import 'package:dartz/dartz.dart';

import '../../../../lib.dart';


class GetCats extends UseCase<List<Cat>, NoParams> {
  final CatRepository repository;

  GetCats(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) {
    return repository.getCats();
  }
}

class NoParams {}