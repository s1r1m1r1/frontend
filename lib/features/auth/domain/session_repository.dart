import 'dart:async';

import 'package:frontend/core/db/db_client.dart';
import 'package:injectable/injectable.dart';

const _tokenKey = '__tokenK__';
const _refreshTokenK = '__refreshTokenK__';

@lazySingleton
class SessionRepository {
  final DbClient _db;
  SessionRepository(this._db);

  Future<String?> readAccessToken() => _db.getKeyValue(_tokenKey);
  Future<void> deleteAccessToken() => _db.deleteKeyValue(_tokenKey);
  Future<String?> readRefreshToken() => _db.getKeyValue(_refreshTokenK);
  Future<void> deleteRefreshToken() => _db.deleteKeyValue(_refreshTokenK);
}
