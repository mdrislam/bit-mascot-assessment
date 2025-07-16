import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bit_mascot_assessment/core/constants/app_constants.dart';
import 'package:bit_mascot_assessment/data/remote/helper/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClientService {
  /// Base headers with Bearer Token
  static Future<Map<String, String>> _getAuthHeaders([
    Map<String, String>? customHeaders,
  ]) async {
    // final token = SharedPrefsService.getString(AppStrorageKey.token);
    return {
      ...?customHeaders,
      // 'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
  }

  /// Handles response status codes and parses body or throws [ApiException]
  static dynamic _handleResponse(http.Response response) {
    final body = json.decode(response.body);

    switch (response.statusCode) {
      case 200:
        return body;
      case 401:
        throw ApiException(body['message'] ?? 'Unauthorized');
      case 422:
        throw ApiException(body['message'] ?? 'Validation Error');
      default:
        throw ApiException(
          'Server Error ${response.statusCode}: ${body['message']}',
        );
    }
  }

  /// POST request with auth
  static Future<dynamic> post({
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final authHeaders = await _getAuthHeaders(headers);
      final response = await http.post(
        Uri.parse(AppConstants.baseUrl + endpoint),
        headers: authHeaders,
        body: body,
      );
      debugPrint('POST ${response.request?.url} → ${response.statusCode}');
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  /// GET request with auth
  static Future<dynamic> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    try {
      final authHeaders = await _getAuthHeaders(headers);
      final response = await http.get(
        Uri.parse(AppConstants.baseUrl + endpoint),
        headers: authHeaders,
      );
      debugPrint('GET ${response.request?.url} → ${response.statusCode}');
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  /// Upload image + fields with auth
  static Future<dynamic> upload({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, String>? fields,
    File? image,
    String imageField = 'image',
  }) async {
    try {
      // final token = SharedPrefsService.getString(AppStrorageKey.token);
      headers ??= {};
      // headers['Authorization'] = 'Bearer $token';

      final request =
          http.MultipartRequest(
              'POST',
              Uri.parse(AppConstants.baseUrl + endpoint),
            )
            ..headers.addAll(headers)
            ..fields.addAll(fields ?? {});

      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(imageField, image.path),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      debugPrint('UPLOAD ${response.request?.url} → ${response.statusCode}');
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  /// Generic error handler for all network calls
  static Never _handleError(dynamic error) {
    if (error is TimeoutException) {
      throw ApiException('Timeout: Unable to connect to the server.');
    } else if (error is SocketException) {
      throw ApiException('No Internet connection. ${error.message}');
    } else if (error is http.ClientException) {
      throw ApiException('HTTP Client Error: ${error.message}');
    } else if (error is FormatException) {
      throw ApiException('Invalid response format.');
    } else {
      throw ApiException(error.toString());
    }
  }
}
