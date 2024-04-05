import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

class Logger {
  Logger.e(
    dynamic from,
    dynamic message, {
    String? tag,
  }) {
    if (!kDebugMode) {
      /// Здесь можно вставть FirebaseCrashlytics
    }
    _sendLog("❌ FROM ${from is String ? from : from.runtimeType}", tag ?? "",
        message);
  }

  Logger.d(
    dynamic from,
    dynamic message, {
    String? tag,
  }) {
    _sendLog("✅ FROM ${from is String ? from : from.runtimeType}", tag ?? "",
        message);
  }

  Logger.v(
    dynamic from,
    dynamic message, {
    String? tag,
  }) {
    _sendLog("❓ FROM ${from is String ? from : from.runtimeType}", tag ?? "",
        message);
  }

  Logger.dio(String tag, {dynamic message}) {
    _dioLog("○", tag, message ?? "");
  }

  void _sendLog(String icon, String tag, dynamic message) {
    log("$icon $tag:\n"
        " ${message.toString()}\n$icon");
  }

  void _dioLog(String icon, String tag, dynamic message) {
    log("$icon $tag ${message.toString()}");
  }
}

class LoggerInterceptor extends Interceptor {
  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  LoggerInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
  });

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Logger.dio('* Request *');
    Logger.dio('uri', message: options.uri);

    if (request) {
      Logger.dio('method', message: options.method);
      Logger.dio('responseType', message: options.responseType.toString());
      Logger.dio('followRedirects', message: options.followRedirects);
      Logger.dio('connectTimeout', message: options.connectTimeout);
      Logger.dio('receiveTimeout', message: options.receiveTimeout);
      Logger.dio('extra', message: options.extra);
    }
    if (requestHeader) {
      Logger.dio('headers:');
      options.headers.forEach((key, v) => Logger.dio(' $key', message: v));
    }
    if (requestBody) {
      Logger.dio('data:');
      _printAll(options.data);
    }
    Logger.dio('');
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (error) {
      Logger.dio('* DioError *:');
      Logger.dio('uri: ${err.requestOptions.uri}');
      Logger.dio('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      Logger.dio('');
    }
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    Logger.dio('* Response *');
    _printResponse(response);
  }

  void _printResponse(Response response) {
    Logger.dio('uri', message: response.requestOptions.uri);
    if (responseHeader) {
      Logger.dio('statusCode', message: response.statusCode);
      if (response.isRedirect == true) {
        Logger.dio('redirect', message: response.realUri);
      }
      Logger.dio('headers:');
      response.headers
          .forEach((key, v) => Logger.dio(' $key', message: v.join(',')));
    }
    if (responseBody) {
      Logger.dio('Response Text:');
      _printAll(response.toString());
    }
    Logger.dio('');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach((element) => Logger.dio(element));
  }
}
