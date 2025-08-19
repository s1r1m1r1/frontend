// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_client.dart';

// ignore_for_file: type=lint
class $KeyValueTableTable extends KeyValueTable
    with TableInfo<$KeyValueTableTable, KeyValueItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeyValueTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_value_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeyValueItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  KeyValueItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyValueItem(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $KeyValueTableTable createAlias(String alias) {
    return $KeyValueTableTable(attachedDatabase, alias);
  }
}

class KeyValueItem extends DataClass implements Insertable<KeyValueItem> {
  final String key;
  final String value;
  const KeyValueItem({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  KeyValueTableCompanion toCompanion(bool nullToAbsent) {
    return KeyValueTableCompanion(key: Value(key), value: Value(value));
  }

  factory KeyValueItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyValueItem(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  KeyValueItem copyWith({String? key, String? value}) =>
      KeyValueItem(key: key ?? this.key, value: value ?? this.value);
  KeyValueItem copyWithCompanion(KeyValueTableCompanion data) {
    return KeyValueItem(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueItem(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyValueItem &&
          other.key == this.key &&
          other.value == this.value);
}

class KeyValueTableCompanion extends UpdateCompanion<KeyValueItem> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const KeyValueTableCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeyValueTableCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<KeyValueItem> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeyValueTableCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return KeyValueTableCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueTableCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DbClient extends GeneratedDatabase {
  _$DbClient(QueryExecutor e) : super(e);
  $DbClientManager get managers => $DbClientManager(this);
  late final $KeyValueTableTable keyValueTable = $KeyValueTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [keyValueTable];
}

typedef $$KeyValueTableTableCreateCompanionBuilder =
    KeyValueTableCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$KeyValueTableTableUpdateCompanionBuilder =
    KeyValueTableCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$KeyValueTableTableFilterComposer
    extends Composer<_$DbClient, $KeyValueTableTable> {
  $$KeyValueTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeyValueTableTableOrderingComposer
    extends Composer<_$DbClient, $KeyValueTableTable> {
  $$KeyValueTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeyValueTableTableAnnotationComposer
    extends Composer<_$DbClient, $KeyValueTableTable> {
  $$KeyValueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$KeyValueTableTableTableManager
    extends
        RootTableManager<
          _$DbClient,
          $KeyValueTableTable,
          KeyValueItem,
          $$KeyValueTableTableFilterComposer,
          $$KeyValueTableTableOrderingComposer,
          $$KeyValueTableTableAnnotationComposer,
          $$KeyValueTableTableCreateCompanionBuilder,
          $$KeyValueTableTableUpdateCompanionBuilder,
          (
            KeyValueItem,
            BaseReferences<_$DbClient, $KeyValueTableTable, KeyValueItem>,
          ),
          KeyValueItem,
          PrefetchHooks Function()
        > {
  $$KeyValueTableTableTableManager(_$DbClient db, $KeyValueTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeyValueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeyValueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeyValueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  KeyValueTableCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => KeyValueTableCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeyValueTableTableProcessedTableManager =
    ProcessedTableManager<
      _$DbClient,
      $KeyValueTableTable,
      KeyValueItem,
      $$KeyValueTableTableFilterComposer,
      $$KeyValueTableTableOrderingComposer,
      $$KeyValueTableTableAnnotationComposer,
      $$KeyValueTableTableCreateCompanionBuilder,
      $$KeyValueTableTableUpdateCompanionBuilder,
      (
        KeyValueItem,
        BaseReferences<_$DbClient, $KeyValueTableTable, KeyValueItem>,
      ),
      KeyValueItem,
      PrefetchHooks Function()
    >;

class $DbClientManager {
  final _$DbClient _db;
  $DbClientManager(this._db);
  $$KeyValueTableTableTableManager get keyValueTable =>
      $$KeyValueTableTableTableManager(_db, _db.keyValueTable);
}
