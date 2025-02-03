import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat.dart';
import '../repositories/cat_repository.dart';

class GetCatsFIlter extends UseCase<List<Cat>, String> {
  final CatRepository repository;

  GetCatsFIlter(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(String params) {
    return repository.getCatsFilter(params);
  }
}
