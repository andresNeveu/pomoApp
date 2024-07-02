// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(e);
  _$DBManager get managers => _$DBManager(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
}

class _$DBManager {
  final _$DB _db;
  _$DBManager(this._db);
}
