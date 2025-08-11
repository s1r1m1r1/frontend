// lib/services/api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:injectable/injectable.dart';
import 'package:sha_red/sha_red.dart';

import '../../app/logger/log_colors.dart';
import '../../models/user.dart';

@lazySingleton
class RegistrationApiService {
  final Dio _client;

  RegistrationApiService(@Named('registration') this._client);

  Future<TokensDto> signup(EmailCredentialDto dto) async {
    final response = await _client.post('/users/signup', data: json.encode(dto.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decoded = response.data; // Assuming it returns some user data/

      return TokensDto.fromJson(decoded);
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<User> createUser(User user) async {
    final response = await _client.post('/users', data: user.toJson());

    if (response.statusCode == HttpStatus.created) {
      return User.fromJson(response.data);
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<TokensDto> login(EmailCredentialDto dto) async {
    debugPrint('$green Login start $reset ');
    final response = await _client.post('/users/login', data: dto.toJson());
    if (response.statusCode == HttpStatus.accepted) {
      final decoded = response.data; // Assuming it returns some user data/token
      debugPrint('$green Login response: $reset $decoded');
      return TokensDto.fromJson(decoded);
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<TokensDto> refresh(String refreshToken) async {
    debugPrint('$green refresh start $reset ');
    final response = await _client.post(
      '/users/refresh',
      data: RefreshTokenDto(refreshToken).toJson(),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == HttpStatus.accepted) {
      final decoded = response.data; // Assuming it returns some user data/token
      debugPrint('$green Refresh token $reset response: $decoded');
      return TokensDto.fromJson(decoded);
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  Future<void> profile(String token) async {
    final response = await _client.get('/profile', options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200) {
      return;
    }
  }
}
