import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../app/constants/app/http_url.dart';
import '../../app/constants/enum/general_enum.dart';
import 'ihttp_client.dart';
import '../exception/app_exception.dart';

/// written this class for http client
class HttpClient extends IHttpClient {
  HttpClient._() : super(HttpUrl.baseUrl);

  static final HttpClient _instance = HttpClient._();

  factory HttpClient() => _instance;

  /// http get method
  Future<http.Response?> request(
    HttpMethod httpMethod,
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String? baseUrl,
  }) async {
    http.Response? response = await _request(
      httpMethod,
      method,
      headerParam,
      bodyParam,
      baseUrl: baseUrl,
    ).catchError(
      (error, stackTrace) => _httpErrorHandler(
        '${baseUrl ?? HttpUrl.baseUrl}/$method',
        error,
        stackTrace,
        headerParam,
        bodyParam,
      ),
    );
    _logS('{${httpMethod.name.toUpperCase()}} ' + HttpUrl.baseUrl + '/' + method, headerParam, response!.statusCode, jsonEncode(bodyParam), response.body);
    if (response!.statusCode >= HttpStatus.clientClosedRequest &&
        response.statusCode < HttpStatus.networkConnectTimeoutError) {
      throw ServerError();
    }
    return response;
  }

  Future<http.Response?> _request(
    HttpMethod httpMethod,
    String method,
    Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam, {
    String? baseUrl,
  }) async {
    final http.Response? response;
    switch (httpMethod) {
      case HttpMethod.GET:
        response = await get(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          baseUrl: baseUrl,
        );
        break;
      case HttpMethod.POST:
        response = await post(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          baseUrl: baseUrl,
        );
        break;
      case HttpMethod.PUT:
        response = await put(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          baseUrl: baseUrl,
        );
        break;
      case HttpMethod.DELETE:
        response = await delete(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          baseUrl: baseUrl,
        );
        break;
      case HttpMethod.UPDATE:
        response = await update(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          baseUrl: baseUrl,
        );
        break;
    }
    return response;
  }

  _httpErrorHandler(
    String url,
    error,
    stackTrace,
    Map<String, String>? header,
    Map<String, dynamic> requestBody,
  ) {
    if (error is SocketException) {
      throw InternetError();
    } else if (error is FormatException) {
      throw AppException();
    } else {
      throw AppException();
    }
  }
}


  void _logS(String url, Map<String, String>? header, int statusCode, String request, String response) {
    log('_______________________________ Http Start ________________________________', name: 'Http');
    log('Api Request Url: $url', name: 'Http');
    log('Header: ${jsonEncode(header)}', name: 'Http');
    log('Status Code: $statusCode', name: 'Http');
    log('Request: $request', name: 'Http');
    log('Response: $response', name: 'Http');
    log('________________________________ Http End _________________________________', name: 'Http');
  }
