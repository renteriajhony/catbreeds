import 'package:dartz/dartz.dart';

import '../../../../lib.dart';



abstract class CatRepository {
  Future<Either<Failure, List<Cat>>> getCats();
  Future<Either<Failure, List<Cat>>> getCatsFilter(String filter);
}