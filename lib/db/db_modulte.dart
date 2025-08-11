// import 'package:drift/native.dart';
import 'package:frontend/db/connection/native.dart';

import 'package:frontend/db/db_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DbClientModule {
  @lazySingleton
  DbClient get dbClient => DbClient(openConnection());
  // DbClient get dbClient => DbClient(NativeDatabase.memory());
}
