import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/cat.dart';


abstract class CatRepository {
  Future<Either<Failure, List<Cat>>> getCats();
}