import 'dart:developer';

import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic> data;

  ApiRequest({required this.url, required this.data});

  Dio _dio() => Dio(
        BaseOptions(
            /*baseUrl: '',
            queryParameters: {},
            method: "GET",
            connectTimeout: Duration(seconds: 120),
            headers: {}*/
            ),
      );

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((value) {
      log('url is $url,  value $value');
      try {
        if (onSuccess != null) onSuccess(value.data);
        //if (onSuccess != null) onSuccess(value.data);
      } catch (e) {
        log('url is $url,  value of Error is : $e');
      }
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
