import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl, receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SharedPreference.getData(key: SharedPreferenceKey.token)}',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    required dynamic data ,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SharedPreference.getData(key: SharedPreferenceKey.token)}',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    required dynamic data ,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SharedPreference.getData(key: SharedPreferenceKey.token)}',
    };
    return await dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
