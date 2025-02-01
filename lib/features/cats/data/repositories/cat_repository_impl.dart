import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cat.dart';
import '../../domain/repositories/cat_repository.dart';
import '../datasources/cat_remote_data_source.dart';

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
}
