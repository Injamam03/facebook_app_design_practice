import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart' hide FormData;
import 'package:get/get_connect/http/src/multipart/multipart_file.dart' hide MultipartFile;

import '../../utils/error_log.dart';
import '../storage_services/get_storage_services.dart';
import 'api.dart';

class ApiServices {
  ///////////////
  ApiServices._privateConstructor();
  static final ApiServices _instance = ApiServices._privateConstructor();
  static ApiServices get instance => _instance;

  //////////  object
  final _api = AppApi();
  final _storageServices = StorageServices.instance;

  // ============== PUT ==================================================================
  Future<dynamic> putServices({
    required String url,
    dynamic body,
    int statusCode = 200,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _api.sendRequest.put(
        url,
        data: body,
        queryParameters: query,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      }
      return null;
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      await _handleDioException(e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== POST ==================================================================
  Future<dynamic> postServices({
    required String url,
    dynamic body,
    int statusCodeStart = 200,
    int statusCodeEnd = 299,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _api.sendRequest.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.statusCode! >= statusCodeStart &&
          response.statusCode! <= statusCodeEnd) {
        return response.data;
      }
      return null;
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      await _handleDioException(e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== GET ==================================================================
  Future<dynamic> getServices(
      String url, {
        int statusCode = 200,
        Map<String, dynamic>? queryParameters,
        dynamic body,
      }) async {
    try {
      final response = await _api.sendRequest.get(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      }
      return null;
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      await _handleDioException(e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== PATCH ==================================================================
  Future<dynamic> patchServices({
    required String url,
    Object? body,
    int statusCode = 200,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await _api.sendRequest.patch(
        url,
        data: body,
        queryParameters: query,
        options: options,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      }
      return null;
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      await _handleDioException(e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== DELETE ==================================================================
  Future<dynamic> deleteServices({
    required String url,
    Object? body,
    int statusCode = 200,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await _api.sendRequest.delete(
        url,
        data: body,
        queryParameters: query,
        options: options,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      }
      return null;
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      await _handleDioException(e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== MULTIPART ==================================================================
  Future<dynamic> multipartServices({
    required String url,
    Map<String, dynamic>? body,
    List<String>? filePath,
    List<String>? fileKey,
    int statusCodeStart = 200,
    int statusCodeEnd = 299,
  }) async {
    try {
      FormData formData = FormData();

      if (body != null) {
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      if (filePath != null &&
          fileKey != null &&
          filePath.length == fileKey.length) {
        for (int i = 0; i < filePath.length; i++) {
          File file = File(filePath[i]);
          if (file.existsSync()) {
            formData.files.add(
              MapEntry(
                fileKey[i],
                await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last,
                ),
              ),
            );
          }
        }
      }

      final response = await _api.sendRequest.post(
        url,
        data: formData,
      );

      if (response.statusCode! >= statusCodeStart &&
          response.statusCode! <= statusCodeEnd) {
        return response.data;
      }
      return null;
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      await _handleDioException(e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== Common DioException Handler ==================================================================
  Future<void> _handleDioException(DioException e) async {
    if (e.response != null) {
      if (e.response?.statusCode == 401) {
        await _storageServices.storageClear();
      }
      errorLog('api dio error response', e.response?.data);
    } else {
      errorLog('api dio exception', e);
    }
  }
}