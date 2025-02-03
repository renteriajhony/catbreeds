

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/cat_model.dart';

/// [CatRemoteDataSource] Representacion de llamado de datos del modulo cat
abstract class CatRemoteDataSource {
  /// Consumo de api, para traer todos los gatos
  Future<List<CatModel>> getCats();
  /// COnsumo de api para traer los gatos segun filtro de busqueda
  Future<List<CatModel>> getCatsFilter(String filter);
}

/// [CatRemoteDataSourceImpl] Implementacion del llamado de datos del modulo cat.
class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  CatRemoteDataSourceImpl({required this.dio});
  final Dio dio;
  final String apiBaseUrl = dotenv.get('API_BASE_URL');
  final String apiSearchUrl = dotenv.get('API_SEARCH_URL');
  final String apiKey = dotenv.get('API_KEY');

  @override
  Future<List<CatModel>> getCats() async {
    final response = await dio.get(apiBaseUrl);

    if (response.statusCode == 200) {
      List<CatModel> listCats = (response.data as List).map((element) {
        return CatModel.fromJson(element);
      }).toList();
      return listCats;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CatModel>> getCatsFilter(String filter) async {
    final response = await dio.get(apiSearchUrl,
        queryParameters: {'q': filter, 'attach_image': 1, 'api_key': apiKey});

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
