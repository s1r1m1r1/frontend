import 'package:drift/native.dart';
// import 'package:frontend/core/db/connection/native.dart';

import 'package:frontend/core/db/db_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DbClientModule {
  @lazySingleton
  DbClient get dbClient => DbClient(NativeDatabase.memory());
  // DbClient get dbClient => DbClient(openConnection());
}
