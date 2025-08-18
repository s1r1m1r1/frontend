// lib/services/api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

import '../../app/logger/log_colors.dart';

class RegApiException implements Exception {
  RegApiException(this.message);
  final String? message;
}

@lazySingleton
class RegistrationApiService {
  final Dio _client;

  RegistrationApiService(@Named('registration') this._client);

  Future<SessionDto> signup(EmailCredentialDto dto) async {
    final response = await _client.post(
      '/users/signup',
      data: json.encode(dto.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decoded = response.data; // Assuming it returns some user data/

      return SessionDto.fromJson(decoded);
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<SessionDto> login(EmailCredentialDto dto) async {
    debugPrint('$green Login start $reset ');
    final response = await _client.post('/users/login', data: dto.toJson());
    if (response.statusCode == HttpStatus.accepted) {
      final decoded = response.data; // Assuming it returns some user data/token
      debugPrint('$green Login response: $reset $decoded');
      return SessionDto.fromJson(decoded);
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<SessionDto> refresh(String refreshToken) async {
    debugPrint('$green refresh start $reset ');
    final response = await _client.post(
      '/users/refresh',
      data: RefreshTokenDto(refreshToken).toJson(),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == HttpStatus.accepted) {
      final decoded = response.data; // Assuming it returns some user data/token
      debugPrint('$green Refresh token $reset response: $decoded');
      return SessionDto.fromJson(decoded);
    } else {
      throw RegApiException('Failed to refresh token');
    }
  }

  Future<SessionDto> getSession(String token) async {
    final response = await _client.get(
      '/session',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return SessionDto.fromJson(response.data);
    }
    throw RegApiException('Failed to get profile');
  }
}
