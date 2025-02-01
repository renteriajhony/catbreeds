import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat.dart';
import '../repositories/cat_repository.dart';

class GetCats extends UseCase<List<Cat>, NoParams> {
  final CatRepository repository;

  GetCats(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) {
    return repository.getCats();
  }
}

class NoParams {}