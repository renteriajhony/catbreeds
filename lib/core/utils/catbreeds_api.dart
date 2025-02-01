import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base url
    _dio.options.baseUrl = 'http://localhost:8080/api/';

    // Configurar Headres
    _dio.options.headers = {
      // 'x-token': LocalStorage.prefs.get('token') ?? '',
    };
  }

  static Future<Map<String, dynamic>> httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioException catch (e) {
      throw HttpException('Error get $e');
    }
  }

  static Future<Map<String, dynamic>> httpPost(
    String path,
    Map<String, dynamic> data,
  ) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } on DioException catch (e) {
      throw HttpException('Error post $e');
    }
  }

  static Future<Map<String, dynamic>> httpPut(
    String path,
    Map<String, dynamic> data,
  ) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioException catch (e) {
      throw HttpException('Error put $e');
    }
  }

  static Future<Map<String, dynamic>> httpDelete(
    String path,
    Map<String, dynamic> data,
  ) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } on DioException catch (e) {
      throw HttpException('Error delete $e');
    }
  }

  static Future<Map<String, dynamic>> httpUploadFile(
    String path,
    Uint8List bytes,
  ) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioException catch (e) {
      throw HttpException('Error put $e');
    }
  }
}
