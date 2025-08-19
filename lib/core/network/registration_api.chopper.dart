// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RegistrationApi extends RegistrationApi {
  _$RegistrationApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RegistrationApi;

  @override
  Future<Response<SessionDto>> signup(EmailCredentialDto dto) {
    final Uri $url = Uri.parse('/users/signup');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionDto, SessionDto>($request);
  }

  @override
  Future<Response<SessionDto>> login(EmailCredentialDto dto) {
    final Uri $url = Uri.parse('/users/login');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionDto, SessionDto>($request);
  }

  @override
  Future<Response<SessionDto>> refresh(RefreshTokenDto dto) {
    final Uri $url = Uri.parse('/users/refresh');
    final $body = dto;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SessionDto, SessionDto>($request);
  }
}
