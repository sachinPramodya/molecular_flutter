import 'package:dio/dio.dart';

final String basePath = "localhost";

final String baseUrl = "http://" + basePath + "/api/";

var http = new Dio();

InterceptorsWrapper basePathInterceptor;

initHttp() {
  addBasePathInterceptor();
}

addBasePathInterceptor() {
  basePathInterceptor =
      InterceptorsWrapper(onRequest: (RequestOptions options) {
    options.baseUrl = baseUrl;
  });

  http.interceptors.add(basePathInterceptor);
}
