// Define a table for key-value pairs

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
// import 'package:drift/native.dart';

import 'connection/native.dart';
import 'tables/key_value_table.dart';
part 'db_client.g.dart';

@DriftDatabase(tables: [KeyValueTable])
class DbClient extends _$DbClient {
  DbClient([QueryExecutor? executor]) : super(executor ?? openConnection());

  @override
  int get schemaVersion => 1; // Increment this if you change your schema

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 1) {
        await m.createAll();
      }
    },
    beforeOpen: (details) async {
      // Make sure that foreign keys are enabled
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
  // Perform any actions before the database is opened

  // Method to save a key-value pair
  Future<void> saveKeyValue(String key, String value) {
    return into(keyValueTable).insertOnConflictUpdate(KeyValueTableCompanion.insert(key: key, value: value));
  }

  // Method to retrieve a value by key
  Future<String?> getKeyValue(String key) async {
    final result = await (select(keyValueTable)..where((t) => t.key.equals(key))).getSingleOrNull();
    return result?.value;
  }

  // Method to delete a key-value pair
  Future<void> deleteKeyValue(String key) {
    return (delete(keyValueTable)..where((t) => t.key.equals(key))).go();
  }
}
