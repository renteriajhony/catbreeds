import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

/// [CatRepositoryImpl] Implementacion del repositorio del modulo cat.
class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;

  CatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Cat>>> getCats() async {
    try {
      final cats = await remoteDataSource.getCats();
      return Right(cats);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Cat>>> getCatsFilter(String filter) async {
    try {
      final cats = await remoteDataSource.getCatsFilter(filter);
      return Right(cats);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
