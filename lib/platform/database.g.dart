// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PomodorosTable extends Pomodoros
    with TableInfo<$PomodorosTable, Pomodoro> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PomodorosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _secondsMeta =
      const VerificationMeta('seconds');
  @override
  late final GeneratedColumn<int> seconds = GeneratedColumn<int>(
      'seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, seconds, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pomodoros';
  @override
  VerificationContext validateIntegrity(Insertable<Pomodoro> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('seconds')) {
      context.handle(_secondsMeta,
          seconds.isAcceptableOrUnknown(data['seconds']!, _secondsMeta));
    } else if (isInserting) {
      context.missing(_secondsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pomodoro map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pomodoro(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      seconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seconds'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $PomodorosTable createAlias(String alias) {
    return $PomodorosTable(attachedDatabase, alias);
  }
}

class Pomodoro extends DataClass implements Insertable<Pomodoro> {
  final int id;
  final int seconds;
  final DateTime date;
  const Pomodoro({required this.id, required this.seconds, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['seconds'] = Variable<int>(seconds);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  PomodorosCompanion toCompanion(bool nullToAbsent) {
    return PomodorosCompanion(
      id: Value(id),
      seconds: Value(seconds),
      date: Value(date),
    );
  }

  factory Pomodoro.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pomodoro(
      id: serializer.fromJson<int>(json['id']),
      seconds: serializer.fromJson<int>(json['seconds']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'seconds': serializer.toJson<int>(seconds),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Pomodoro copyWith({int? id, int? seconds, DateTime? date}) => Pomodoro(
        id: id ?? this.id,
        seconds: seconds ?? this.seconds,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Pomodoro(')
          ..write('id: $id, ')
          ..write('seconds: $seconds, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, seconds, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pomodoro &&
          other.id == this.id &&
          other.seconds == this.seconds &&
          other.date == this.date);
}

class PomodorosCompanion extends UpdateCompanion<Pomodoro> {
  final Value<int> id;
  final Value<int> seconds;
  final Value<DateTime> date;
  const PomodorosCompanion({
    this.id = const Value.absent(),
    this.seconds = const Value.absent(),
    this.date = const Value.absent(),
  });
  PomodorosCompanion.insert({
    this.id = const Value.absent(),
    required int seconds,
    required DateTime date,
  })  : seconds = Value(seconds),
        date = Value(date);
  static Insertable<Pomodoro> custom({
    Expression<int>? id,
    Expression<int>? seconds,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seconds != null) 'seconds': seconds,
      if (date != null) 'date': date,
    });
  }

  PomodorosCompanion copyWith(
      {Value<int>? id, Value<int>? seconds, Value<DateTime>? date}) {
    return PomodorosCompanion(
      id: id ?? this.id,
      seconds: seconds ?? this.seconds,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (seconds.present) {
      map['seconds'] = Variable<int>(seconds.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PomodorosCompanion(')
          ..write('id: $id, ')
          ..write('seconds: $seconds, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ShortsTable extends Shorts with TableInfo<$ShortsTable, Short> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShortsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _secondsMeta =
      const VerificationMeta('seconds');
  @override
  late final GeneratedColumn<int> seconds = GeneratedColumn<int>(
      'seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, seconds, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shorts';
  @override
  VerificationContext validateIntegrity(Insertable<Short> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('seconds')) {
      context.handle(_secondsMeta,
          seconds.isAcceptableOrUnknown(data['seconds']!, _secondsMeta));
    } else if (isInserting) {
      context.missing(_secondsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Short map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Short(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      seconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seconds'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $ShortsTable createAlias(String alias) {
    return $ShortsTable(attachedDatabase, alias);
  }
}

class Short extends DataClass implements Insertable<Short> {
  final int id;
  final int seconds;
  final DateTime date;
  const Short({required this.id, required this.seconds, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['seconds'] = Variable<int>(seconds);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ShortsCompanion toCompanion(bool nullToAbsent) {
    return ShortsCompanion(
      id: Value(id),
      seconds: Value(seconds),
      date: Value(date),
    );
  }

  factory Short.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Short(
      id: serializer.fromJson<int>(json['id']),
      seconds: serializer.fromJson<int>(json['seconds']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'seconds': serializer.toJson<int>(seconds),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Short copyWith({int? id, int? seconds, DateTime? date}) => Short(
        id: id ?? this.id,
        seconds: seconds ?? this.seconds,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Short(')
          ..write('id: $id, ')
          ..write('seconds: $seconds, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, seconds, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Short &&
          other.id == this.id &&
          other.seconds == this.seconds &&
          other.date == this.date);
}

class ShortsCompanion extends UpdateCompanion<Short> {
  final Value<int> id;
  final Value<int> seconds;
  final Value<DateTime> date;
  const ShortsCompanion({
    this.id = const Value.absent(),
    this.seconds = const Value.absent(),
    this.date = const Value.absent(),
  });
  ShortsCompanion.insert({
    this.id = const Value.absent(),
    required int seconds,
    required DateTime date,
  })  : seconds = Value(seconds),
        date = Value(date);
  static Insertable<Short> custom({
    Expression<int>? id,
    Expression<int>? seconds,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seconds != null) 'seconds': seconds,
      if (date != null) 'date': date,
    });
  }

  ShortsCompanion copyWith(
      {Value<int>? id, Value<int>? seconds, Value<DateTime>? date}) {
    return ShortsCompanion(
      id: id ?? this.id,
      seconds: seconds ?? this.seconds,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (seconds.present) {
      map['seconds'] = Variable<int>(seconds.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShortsCompanion(')
          ..write('id: $id, ')
          ..write('seconds: $seconds, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $LongsTable extends Longs with TableInfo<$LongsTable, Long> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _secondsMeta =
      const VerificationMeta('seconds');
  @override
  late final GeneratedColumn<int> seconds = GeneratedColumn<int>(
      'seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, seconds, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'longs';
  @override
  VerificationContext validateIntegrity(Insertable<Long> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('seconds')) {
      context.handle(_secondsMeta,
          seconds.isAcceptableOrUnknown(data['seconds']!, _secondsMeta));
    } else if (isInserting) {
      context.missing(_secondsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Long map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Long(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      seconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seconds'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $LongsTable createAlias(String alias) {
    return $LongsTable(attachedDatabase, alias);
  }
}

class Long extends DataClass implements Insertable<Long> {
  final int id;
  final int seconds;
  final DateTime date;
  const Long({required this.id, required this.seconds, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['seconds'] = Variable<int>(seconds);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  LongsCompanion toCompanion(bool nullToAbsent) {
    return LongsCompanion(
      id: Value(id),
      seconds: Value(seconds),
      date: Value(date),
    );
  }

  factory Long.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Long(
      id: serializer.fromJson<int>(json['id']),
      seconds: serializer.fromJson<int>(json['seconds']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'seconds': serializer.toJson<int>(seconds),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Long copyWith({int? id, int? seconds, DateTime? date}) => Long(
        id: id ?? this.id,
        seconds: seconds ?? this.seconds,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Long(')
          ..write('id: $id, ')
          ..write('seconds: $seconds, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, seconds, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Long &&
          other.id == this.id &&
          other.seconds == this.seconds &&
          other.date == this.date);
}

class LongsCompanion extends UpdateCompanion<Long> {
  final Value<int> id;
  final Value<int> seconds;
  final Value<DateTime> date;
  const LongsCompanion({
    this.id = const Value.absent(),
    this.seconds = const Value.absent(),
    this.date = const Value.absent(),
  });
  LongsCompanion.insert({
    this.id = const Value.absent(),
    required int seconds,
    required DateTime date,
  })  : seconds = Value(seconds),
        date = Value(date);
  static Insertable<Long> custom({
    Expression<int>? id,
    Expression<int>? seconds,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seconds != null) 'seconds': seconds,
      if (date != null) 'date': date,
    });
  }

  LongsCompanion copyWith(
      {Value<int>? id, Value<int>? seconds, Value<DateTime>? date}) {
    return LongsCompanion(
      id: id ?? this.id,
      seconds: seconds ?? this.seconds,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (seconds.present) {
      map['seconds'] = Variable<int>(seconds.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LongsCompanion(')
          ..write('id: $id, ')
          ..write('seconds: $seconds, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pomodorosMeta =
      const VerificationMeta('pomodoros');
  @override
  late final GeneratedColumn<int> pomodoros = GeneratedColumn<int>(
      'pomodoros', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pomodoros, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pomodoros')) {
      context.handle(_pomodorosMeta,
          pomodoros.isAcceptableOrUnknown(data['pomodoros']!, _pomodorosMeta));
    } else if (isInserting) {
      context.missing(_pomodorosMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pomodoros: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pomodoros'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final int pomodoros;
  final String name;
  const Task({required this.id, required this.pomodoros, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pomodoros'] = Variable<int>(pomodoros);
    map['name'] = Variable<String>(name);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      pomodoros: Value(pomodoros),
      name: Value(name),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      pomodoros: serializer.fromJson<int>(json['pomodoros']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pomodoros': serializer.toJson<int>(pomodoros),
      'name': serializer.toJson<String>(name),
    };
  }

  Task copyWith({int? id, int? pomodoros, String? name}) => Task(
        id: id ?? this.id,
        pomodoros: pomodoros ?? this.pomodoros,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('pomodoros: $pomodoros, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pomodoros, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.pomodoros == this.pomodoros &&
          other.name == this.name);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<int> pomodoros;
  final Value<String> name;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.pomodoros = const Value.absent(),
    this.name = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required int pomodoros,
    required String name,
  })  : pomodoros = Value(pomodoros),
        name = Value(name);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<int>? pomodoros,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pomodoros != null) 'pomodoros': pomodoros,
      if (name != null) 'name': name,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id, Value<int>? pomodoros, Value<String>? name}) {
    return TasksCompanion(
      id: id ?? this.id,
      pomodoros: pomodoros ?? this.pomodoros,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pomodoros.present) {
      map['pomodoros'] = Variable<int>(pomodoros.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('pomodoros: $pomodoros, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PomodorosTasksTable extends PomodorosTasks
    with TableInfo<$PomodorosTasksTable, PomodorosTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PomodorosTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pomodoroMeta =
      const VerificationMeta('pomodoro');
  @override
  late final GeneratedColumn<int> pomodoro = GeneratedColumn<int>(
      'pomodoro', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pomodoros (id)'));
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<int> task = GeneratedColumn<int>(
      'task', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tasks (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, pomodoro, task];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pomodoros_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<PomodorosTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pomodoro')) {
      context.handle(_pomodoroMeta,
          pomodoro.isAcceptableOrUnknown(data['pomodoro']!, _pomodoroMeta));
    } else if (isInserting) {
      context.missing(_pomodoroMeta);
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PomodorosTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PomodorosTask(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pomodoro: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pomodoro'])!,
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task'])!,
    );
  }

  @override
  $PomodorosTasksTable createAlias(String alias) {
    return $PomodorosTasksTable(attachedDatabase, alias);
  }
}

class PomodorosTask extends DataClass implements Insertable<PomodorosTask> {
  final int id;
  final int pomodoro;
  final int task;
  const PomodorosTask(
      {required this.id, required this.pomodoro, required this.task});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pomodoro'] = Variable<int>(pomodoro);
    map['task'] = Variable<int>(task);
    return map;
  }

  PomodorosTasksCompanion toCompanion(bool nullToAbsent) {
    return PomodorosTasksCompanion(
      id: Value(id),
      pomodoro: Value(pomodoro),
      task: Value(task),
    );
  }

  factory PomodorosTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PomodorosTask(
      id: serializer.fromJson<int>(json['id']),
      pomodoro: serializer.fromJson<int>(json['pomodoro']),
      task: serializer.fromJson<int>(json['task']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pomodoro': serializer.toJson<int>(pomodoro),
      'task': serializer.toJson<int>(task),
    };
  }

  PomodorosTask copyWith({int? id, int? pomodoro, int? task}) => PomodorosTask(
        id: id ?? this.id,
        pomodoro: pomodoro ?? this.pomodoro,
        task: task ?? this.task,
      );
  @override
  String toString() {
    return (StringBuffer('PomodorosTask(')
          ..write('id: $id, ')
          ..write('pomodoro: $pomodoro, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pomodoro, task);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PomodorosTask &&
          other.id == this.id &&
          other.pomodoro == this.pomodoro &&
          other.task == this.task);
}

class PomodorosTasksCompanion extends UpdateCompanion<PomodorosTask> {
  final Value<int> id;
  final Value<int> pomodoro;
  final Value<int> task;
  const PomodorosTasksCompanion({
    this.id = const Value.absent(),
    this.pomodoro = const Value.absent(),
    this.task = const Value.absent(),
  });
  PomodorosTasksCompanion.insert({
    this.id = const Value.absent(),
    required int pomodoro,
    required int task,
  })  : pomodoro = Value(pomodoro),
        task = Value(task);
  static Insertable<PomodorosTask> custom({
    Expression<int>? id,
    Expression<int>? pomodoro,
    Expression<int>? task,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pomodoro != null) 'pomodoro': pomodoro,
      if (task != null) 'task': task,
    });
  }

  PomodorosTasksCompanion copyWith(
      {Value<int>? id, Value<int>? pomodoro, Value<int>? task}) {
    return PomodorosTasksCompanion(
      id: id ?? this.id,
      pomodoro: pomodoro ?? this.pomodoro,
      task: task ?? this.task,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pomodoro.present) {
      map['pomodoro'] = Variable<int>(pomodoro.value);
    }
    if (task.present) {
      map['task'] = Variable<int>(task.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PomodorosTasksCompanion(')
          ..write('id: $id, ')
          ..write('pomodoro: $pomodoro, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }
}

class $CacheSettingsTable extends CacheSettings
    with TableInfo<$CacheSettingsTable, CacheSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pomodoroMeta =
      const VerificationMeta('pomodoro');
  @override
  late final GeneratedColumn<int> pomodoro = GeneratedColumn<int>(
      'pomodoro', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _shortMeta = const VerificationMeta('short');
  @override
  late final GeneratedColumn<int> short = GeneratedColumn<int>(
      'short', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<int> long = GeneratedColumn<int>(
      'long', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pomodoro, short, long];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_settings';
  @override
  VerificationContext validateIntegrity(Insertable<CacheSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pomodoro')) {
      context.handle(_pomodoroMeta,
          pomodoro.isAcceptableOrUnknown(data['pomodoro']!, _pomodoroMeta));
    } else if (isInserting) {
      context.missing(_pomodoroMeta);
    }
    if (data.containsKey('short')) {
      context.handle(
          _shortMeta, short.isAcceptableOrUnknown(data['short']!, _shortMeta));
    } else if (isInserting) {
      context.missing(_shortMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CacheSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pomodoro: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pomodoro'])!,
      short: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}short'])!,
      long: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}long'])!,
    );
  }

  @override
  $CacheSettingsTable createAlias(String alias) {
    return $CacheSettingsTable(attachedDatabase, alias);
  }
}

class CacheSetting extends DataClass implements Insertable<CacheSetting> {
  final int id;
  final int pomodoro;
  final int short;
  final int long;
  const CacheSetting(
      {required this.id,
      required this.pomodoro,
      required this.short,
      required this.long});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pomodoro'] = Variable<int>(pomodoro);
    map['short'] = Variable<int>(short);
    map['long'] = Variable<int>(long);
    return map;
  }

  CacheSettingsCompanion toCompanion(bool nullToAbsent) {
    return CacheSettingsCompanion(
      id: Value(id),
      pomodoro: Value(pomodoro),
      short: Value(short),
      long: Value(long),
    );
  }

  factory CacheSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheSetting(
      id: serializer.fromJson<int>(json['id']),
      pomodoro: serializer.fromJson<int>(json['pomodoro']),
      short: serializer.fromJson<int>(json['short']),
      long: serializer.fromJson<int>(json['long']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pomodoro': serializer.toJson<int>(pomodoro),
      'short': serializer.toJson<int>(short),
      'long': serializer.toJson<int>(long),
    };
  }

  CacheSetting copyWith({int? id, int? pomodoro, int? short, int? long}) =>
      CacheSetting(
        id: id ?? this.id,
        pomodoro: pomodoro ?? this.pomodoro,
        short: short ?? this.short,
        long: long ?? this.long,
      );
  @override
  String toString() {
    return (StringBuffer('CacheSetting(')
          ..write('id: $id, ')
          ..write('pomodoro: $pomodoro, ')
          ..write('short: $short, ')
          ..write('long: $long')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pomodoro, short, long);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheSetting &&
          other.id == this.id &&
          other.pomodoro == this.pomodoro &&
          other.short == this.short &&
          other.long == this.long);
}

class CacheSettingsCompanion extends UpdateCompanion<CacheSetting> {
  final Value<int> id;
  final Value<int> pomodoro;
  final Value<int> short;
  final Value<int> long;
  const CacheSettingsCompanion({
    this.id = const Value.absent(),
    this.pomodoro = const Value.absent(),
    this.short = const Value.absent(),
    this.long = const Value.absent(),
  });
  CacheSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int pomodoro,
    required int short,
    required int long,
  })  : pomodoro = Value(pomodoro),
        short = Value(short),
        long = Value(long);
  static Insertable<CacheSetting> custom({
    Expression<int>? id,
    Expression<int>? pomodoro,
    Expression<int>? short,
    Expression<int>? long,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pomodoro != null) 'pomodoro': pomodoro,
      if (short != null) 'short': short,
      if (long != null) 'long': long,
    });
  }

  CacheSettingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? pomodoro,
      Value<int>? short,
      Value<int>? long}) {
    return CacheSettingsCompanion(
      id: id ?? this.id,
      pomodoro: pomodoro ?? this.pomodoro,
      short: short ?? this.short,
      long: long ?? this.long,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pomodoro.present) {
      map['pomodoro'] = Variable<int>(pomodoro.value);
    }
    if (short.present) {
      map['short'] = Variable<int>(short.value);
    }
    if (long.present) {
      map['long'] = Variable<int>(long.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheSettingsCompanion(')
          ..write('id: $id, ')
          ..write('pomodoro: $pomodoro, ')
          ..write('short: $short, ')
          ..write('long: $long')
          ..write(')'))
        .toString();
  }
}

abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(e);
  _$DBManager get managers => _$DBManager(this);
  late final $PomodorosTable pomodoros = $PomodorosTable(this);
  late final $ShortsTable shorts = $ShortsTable(this);
  late final $LongsTable longs = $LongsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $PomodorosTasksTable pomodorosTasks = $PomodorosTasksTable(this);
  late final $CacheSettingsTable cacheSettings = $CacheSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pomodoros, shorts, longs, tasks, pomodorosTasks, cacheSettings];
}

typedef $$PomodorosTableInsertCompanionBuilder = PomodorosCompanion Function({
  Value<int> id,
  required int seconds,
  required DateTime date,
});
typedef $$PomodorosTableUpdateCompanionBuilder = PomodorosCompanion Function({
  Value<int> id,
  Value<int> seconds,
  Value<DateTime> date,
});

class $$PomodorosTableTableManager extends RootTableManager<
    _$DB,
    $PomodorosTable,
    Pomodoro,
    $$PomodorosTableFilterComposer,
    $$PomodorosTableOrderingComposer,
    $$PomodorosTableProcessedTableManager,
    $$PomodorosTableInsertCompanionBuilder,
    $$PomodorosTableUpdateCompanionBuilder> {
  $$PomodorosTableTableManager(_$DB db, $PomodorosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PomodorosTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PomodorosTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PomodorosTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> seconds = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              PomodorosCompanion(
            id: id,
            seconds: seconds,
            date: date,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int seconds,
            required DateTime date,
          }) =>
              PomodorosCompanion.insert(
            id: id,
            seconds: seconds,
            date: date,
          ),
        ));
}

class $$PomodorosTableProcessedTableManager extends ProcessedTableManager<
    _$DB,
    $PomodorosTable,
    Pomodoro,
    $$PomodorosTableFilterComposer,
    $$PomodorosTableOrderingComposer,
    $$PomodorosTableProcessedTableManager,
    $$PomodorosTableInsertCompanionBuilder,
    $$PomodorosTableUpdateCompanionBuilder> {
  $$PomodorosTableProcessedTableManager(super.$state);
}

class $$PomodorosTableFilterComposer
    extends FilterComposer<_$DB, $PomodorosTable> {
  $$PomodorosTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter pomodorosTasksRefs(
      ComposableFilter Function($$PomodorosTasksTableFilterComposer f) f) {
    final $$PomodorosTasksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.pomodorosTasks,
        getReferencedColumn: (t) => t.pomodoro,
        builder: (joinBuilder, parentComposers) =>
            $$PomodorosTasksTableFilterComposer(ComposerState($state.db,
                $state.db.pomodorosTasks, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PomodorosTableOrderingComposer
    extends OrderingComposer<_$DB, $PomodorosTable> {
  $$PomodorosTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ShortsTableInsertCompanionBuilder = ShortsCompanion Function({
  Value<int> id,
  required int seconds,
  required DateTime date,
});
typedef $$ShortsTableUpdateCompanionBuilder = ShortsCompanion Function({
  Value<int> id,
  Value<int> seconds,
  Value<DateTime> date,
});

class $$ShortsTableTableManager extends RootTableManager<
    _$DB,
    $ShortsTable,
    Short,
    $$ShortsTableFilterComposer,
    $$ShortsTableOrderingComposer,
    $$ShortsTableProcessedTableManager,
    $$ShortsTableInsertCompanionBuilder,
    $$ShortsTableUpdateCompanionBuilder> {
  $$ShortsTableTableManager(_$DB db, $ShortsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ShortsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ShortsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$ShortsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> seconds = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              ShortsCompanion(
            id: id,
            seconds: seconds,
            date: date,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int seconds,
            required DateTime date,
          }) =>
              ShortsCompanion.insert(
            id: id,
            seconds: seconds,
            date: date,
          ),
        ));
}

class $$ShortsTableProcessedTableManager extends ProcessedTableManager<
    _$DB,
    $ShortsTable,
    Short,
    $$ShortsTableFilterComposer,
    $$ShortsTableOrderingComposer,
    $$ShortsTableProcessedTableManager,
    $$ShortsTableInsertCompanionBuilder,
    $$ShortsTableUpdateCompanionBuilder> {
  $$ShortsTableProcessedTableManager(super.$state);
}

class $$ShortsTableFilterComposer extends FilterComposer<_$DB, $ShortsTable> {
  $$ShortsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ShortsTableOrderingComposer
    extends OrderingComposer<_$DB, $ShortsTable> {
  $$ShortsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$LongsTableInsertCompanionBuilder = LongsCompanion Function({
  Value<int> id,
  required int seconds,
  required DateTime date,
});
typedef $$LongsTableUpdateCompanionBuilder = LongsCompanion Function({
  Value<int> id,
  Value<int> seconds,
  Value<DateTime> date,
});

class $$LongsTableTableManager extends RootTableManager<
    _$DB,
    $LongsTable,
    Long,
    $$LongsTableFilterComposer,
    $$LongsTableOrderingComposer,
    $$LongsTableProcessedTableManager,
    $$LongsTableInsertCompanionBuilder,
    $$LongsTableUpdateCompanionBuilder> {
  $$LongsTableTableManager(_$DB db, $LongsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LongsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LongsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$LongsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> seconds = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              LongsCompanion(
            id: id,
            seconds: seconds,
            date: date,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int seconds,
            required DateTime date,
          }) =>
              LongsCompanion.insert(
            id: id,
            seconds: seconds,
            date: date,
          ),
        ));
}

class $$LongsTableProcessedTableManager extends ProcessedTableManager<
    _$DB,
    $LongsTable,
    Long,
    $$LongsTableFilterComposer,
    $$LongsTableOrderingComposer,
    $$LongsTableProcessedTableManager,
    $$LongsTableInsertCompanionBuilder,
    $$LongsTableUpdateCompanionBuilder> {
  $$LongsTableProcessedTableManager(super.$state);
}

class $$LongsTableFilterComposer extends FilterComposer<_$DB, $LongsTable> {
  $$LongsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LongsTableOrderingComposer extends OrderingComposer<_$DB, $LongsTable> {
  $$LongsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get seconds => $state.composableBuilder(
      column: $state.table.seconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TasksTableInsertCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  required int pomodoros,
  required String name,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  Value<int> pomodoros,
  Value<String> name,
});

class $$TasksTableTableManager extends RootTableManager<
    _$DB,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableProcessedTableManager,
    $$TasksTableInsertCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder> {
  $$TasksTableTableManager(_$DB db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TasksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TasksTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$TasksTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> pomodoros = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            pomodoros: pomodoros,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int pomodoros,
            required String name,
          }) =>
              TasksCompanion.insert(
            id: id,
            pomodoros: pomodoros,
            name: name,
          ),
        ));
}

class $$TasksTableProcessedTableManager extends ProcessedTableManager<
    _$DB,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableProcessedTableManager,
    $$TasksTableInsertCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder> {
  $$TasksTableProcessedTableManager(super.$state);
}

class $$TasksTableFilterComposer extends FilterComposer<_$DB, $TasksTable> {
  $$TasksTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pomodoros => $state.composableBuilder(
      column: $state.table.pomodoros,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter pomodorosTasksRefs(
      ComposableFilter Function($$PomodorosTasksTableFilterComposer f) f) {
    final $$PomodorosTasksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.pomodorosTasks,
        getReferencedColumn: (t) => t.task,
        builder: (joinBuilder, parentComposers) =>
            $$PomodorosTasksTableFilterComposer(ComposerState($state.db,
                $state.db.pomodorosTasks, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TasksTableOrderingComposer extends OrderingComposer<_$DB, $TasksTable> {
  $$TasksTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pomodoros => $state.composableBuilder(
      column: $state.table.pomodoros,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PomodorosTasksTableInsertCompanionBuilder = PomodorosTasksCompanion
    Function({
  Value<int> id,
  required int pomodoro,
  required int task,
});
typedef $$PomodorosTasksTableUpdateCompanionBuilder = PomodorosTasksCompanion
    Function({
  Value<int> id,
  Value<int> pomodoro,
  Value<int> task,
});

class $$PomodorosTasksTableTableManager extends RootTableManager<
    _$DB,
    $PomodorosTasksTable,
    PomodorosTask,
    $$PomodorosTasksTableFilterComposer,
    $$PomodorosTasksTableOrderingComposer,
    $$PomodorosTasksTableProcessedTableManager,
    $$PomodorosTasksTableInsertCompanionBuilder,
    $$PomodorosTasksTableUpdateCompanionBuilder> {
  $$PomodorosTasksTableTableManager(_$DB db, $PomodorosTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PomodorosTasksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PomodorosTasksTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PomodorosTasksTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> pomodoro = const Value.absent(),
            Value<int> task = const Value.absent(),
          }) =>
              PomodorosTasksCompanion(
            id: id,
            pomodoro: pomodoro,
            task: task,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int pomodoro,
            required int task,
          }) =>
              PomodorosTasksCompanion.insert(
            id: id,
            pomodoro: pomodoro,
            task: task,
          ),
        ));
}

class $$PomodorosTasksTableProcessedTableManager extends ProcessedTableManager<
    _$DB,
    $PomodorosTasksTable,
    PomodorosTask,
    $$PomodorosTasksTableFilterComposer,
    $$PomodorosTasksTableOrderingComposer,
    $$PomodorosTasksTableProcessedTableManager,
    $$PomodorosTasksTableInsertCompanionBuilder,
    $$PomodorosTasksTableUpdateCompanionBuilder> {
  $$PomodorosTasksTableProcessedTableManager(super.$state);
}

class $$PomodorosTasksTableFilterComposer
    extends FilterComposer<_$DB, $PomodorosTasksTable> {
  $$PomodorosTasksTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PomodorosTableFilterComposer get pomodoro {
    final $$PomodorosTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pomodoro,
        referencedTable: $state.db.pomodoros,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PomodorosTableFilterComposer(ComposerState(
                $state.db, $state.db.pomodoros, joinBuilder, parentComposers)));
    return composer;
  }

  $$TasksTableFilterComposer get task {
    final $$TasksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.task,
        referencedTable: $state.db.tasks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$TasksTableFilterComposer(
            ComposerState(
                $state.db, $state.db.tasks, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PomodorosTasksTableOrderingComposer
    extends OrderingComposer<_$DB, $PomodorosTasksTable> {
  $$PomodorosTasksTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PomodorosTableOrderingComposer get pomodoro {
    final $$PomodorosTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pomodoro,
        referencedTable: $state.db.pomodoros,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PomodorosTableOrderingComposer(ComposerState(
                $state.db, $state.db.pomodoros, joinBuilder, parentComposers)));
    return composer;
  }

  $$TasksTableOrderingComposer get task {
    final $$TasksTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.task,
        referencedTable: $state.db.tasks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$TasksTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.tasks, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$CacheSettingsTableInsertCompanionBuilder = CacheSettingsCompanion
    Function({
  Value<int> id,
  required int pomodoro,
  required int short,
  required int long,
});
typedef $$CacheSettingsTableUpdateCompanionBuilder = CacheSettingsCompanion
    Function({
  Value<int> id,
  Value<int> pomodoro,
  Value<int> short,
  Value<int> long,
});

class $$CacheSettingsTableTableManager extends RootTableManager<
    _$DB,
    $CacheSettingsTable,
    CacheSetting,
    $$CacheSettingsTableFilterComposer,
    $$CacheSettingsTableOrderingComposer,
    $$CacheSettingsTableProcessedTableManager,
    $$CacheSettingsTableInsertCompanionBuilder,
    $$CacheSettingsTableUpdateCompanionBuilder> {
  $$CacheSettingsTableTableManager(_$DB db, $CacheSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CacheSettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CacheSettingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CacheSettingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> pomodoro = const Value.absent(),
            Value<int> short = const Value.absent(),
            Value<int> long = const Value.absent(),
          }) =>
              CacheSettingsCompanion(
            id: id,
            pomodoro: pomodoro,
            short: short,
            long: long,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int pomodoro,
            required int short,
            required int long,
          }) =>
              CacheSettingsCompanion.insert(
            id: id,
            pomodoro: pomodoro,
            short: short,
            long: long,
          ),
        ));
}

class $$CacheSettingsTableProcessedTableManager extends ProcessedTableManager<
    _$DB,
    $CacheSettingsTable,
    CacheSetting,
    $$CacheSettingsTableFilterComposer,
    $$CacheSettingsTableOrderingComposer,
    $$CacheSettingsTableProcessedTableManager,
    $$CacheSettingsTableInsertCompanionBuilder,
    $$CacheSettingsTableUpdateCompanionBuilder> {
  $$CacheSettingsTableProcessedTableManager(super.$state);
}

class $$CacheSettingsTableFilterComposer
    extends FilterComposer<_$DB, $CacheSettingsTable> {
  $$CacheSettingsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pomodoro => $state.composableBuilder(
      column: $state.table.pomodoro,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get short => $state.composableBuilder(
      column: $state.table.short,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get long => $state.composableBuilder(
      column: $state.table.long,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CacheSettingsTableOrderingComposer
    extends OrderingComposer<_$DB, $CacheSettingsTable> {
  $$CacheSettingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pomodoro => $state.composableBuilder(
      column: $state.table.pomodoro,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get short => $state.composableBuilder(
      column: $state.table.short,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get long => $state.composableBuilder(
      column: $state.table.long,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$DBManager {
  final _$DB _db;
  _$DBManager(this._db);
  $$PomodorosTableTableManager get pomodoros =>
      $$PomodorosTableTableManager(_db, _db.pomodoros);
  $$ShortsTableTableManager get shorts =>
      $$ShortsTableTableManager(_db, _db.shorts);
  $$LongsTableTableManager get longs =>
      $$LongsTableTableManager(_db, _db.longs);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$PomodorosTasksTableTableManager get pomodorosTasks =>
      $$PomodorosTasksTableTableManager(_db, _db.pomodorosTasks);
  $$CacheSettingsTableTableManager get cacheSettings =>
      $$CacheSettingsTableTableManager(_db, _db.cacheSettings);
}
