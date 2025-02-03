import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/cat_model.dart';

/// \[CatRemoteDataSource\] Representación de llamado de datos del módulo cat.
abstract class CatRemoteDataSource {
  /// Consumo de API para traer todos los gatos.
  Future<List<CatModel>> getCats();

  /// Consumo de API para traer los gatos según filtro de búsqueda.
  ///
  /// \[filter\]: Filtro de búsqueda para obtener gatos específicos.
  Future<List<CatModel>> getCatsFilter(String filter);
}

/// \[CatRemoteDataSourceImpl\] Implementación del llamado de datos del módulo cat.
class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  /// Constructor de \[CatRemoteDataSourceImpl\].
  ///
  /// \[dio\]: Cliente HTTP para realizar solicitudes.
  CatRemoteDataSourceImpl({required this.dio});

  /// Cliente HTTP para realizar solicitudes.
  final Dio dio;

  /// URL base de la API.
  final String apiBaseUrl = dotenv.get('API_BASE_URL');

  /// URL de búsqueda de la API.
  final String apiSearchUrl = dotenv.get('API_SEARCH_URL');

  /// Clave de la API.
  final String apiKey = dotenv.get('API_KEY');

  /// Obtiene una lista de gatos desde la API.
  ///
  /// Retorna una lista de \[CatModel\] si la solicitud es exitosa.
  /// Lanza una \[ServerException\] si la solicitud falla.
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

  /// Obtiene una lista de gatos filtrados desde la API.
  ///
  /// \[filter\]: Filtro de búsqueda para obtener gatos específicos.
  /// Retorna una lista de \[CatModel\] si la solicitud es exitosa.
  /// Lanza una \[ServerException\] si la solicitud falla.
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