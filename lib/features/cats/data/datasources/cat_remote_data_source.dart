import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/cat_model.dart';

abstract class CatRemoteDataSource {
  Future<List<CatModel>> getCats();
}

class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final Dio dio;

  CatRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CatModel>> getCats() async {
    final response = await dio.get('https://api.thecatapi.com/v1/breeds');

    if (response.statusCode == 200) {
      List<CatModel> listCats = (response.data as List).map((element) {
        return CatModel.fromJson(element);
      }).toList();
      return listCats;
    } else {
      throw ServerException();
    }
  }
}
