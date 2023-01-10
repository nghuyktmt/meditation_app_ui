import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/data/model/my_error.model.dart';
import 'package:test_flutter/data/model/topic.model.dart';

final dio = Dio()
  ..interceptors.add(InterceptorsWrapper(onError: (e, handler) {
    if (e.error is SocketException) {
      return handler.next(DioError(
          requestOptions: e.requestOptions,
          response: e.response,
          type: e.type,
          error: MyError(code: ErrorCode.serverError, originError: e.error)));
    }
  }));

abstract class TopicStorage {
  Future<List<Topic>> load();
}

class AssetTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    try {
      if (kDebugMode) {
        await Future.delayed(const Duration(seconds: 1));
      }
      final jsonContent = await rootBundle.loadString("mock/topics/topics.json");
      final List<dynamic> jsonData = jsonDecode(jsonContent);
      return jsonData.map((e) => Topic.fromJson(e)).toList();
    } on Exception catch (_) {
      throw MyError(code: ErrorCode.unknown);
    }
  }
}

class RemoteTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    try {
      final response = await dio
          .get('https://mocki.io/v1/d75a24d2-1a7a-435b-a8f1-0006c4f7c560');
      final List<dynamic> jsonData = jsonDecode(response.data);
      return jsonData.map((e) => Topic.fromJson(e)).toList();
    } on Exception catch (_) {
      throw MyError(code: ErrorCode.unknown);
    }
  }
}
