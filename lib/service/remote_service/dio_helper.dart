import 'package:dio/dio.dart';

//! Remote Service ==> Dio Api
// request for topics => https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=43127776c8d4446ea91a1c6619eb228d
// requset for search => https://newsapi.org/v2/everything?q=apple&apiKey=43127776c8d4446ea91a1c6619eb228d
// [method] => v2/top-headlines?
// [query] => country=de&category=business&apiKey=43127776c8d4446ea91a1c6619eb228d => link
class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      // query =>  map can be type of <String, dynamic> and only dynamic
      {required String url,
      required Map<String, dynamic> query}) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
