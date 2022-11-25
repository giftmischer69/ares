// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDailyTaskRecordCollection on Isar {
  IsarCollection<DailyTaskRecord> get dailyTaskRecords => this.collection();
}

const DailyTaskRecordSchema = CollectionSchema(
  name: r'DailyTaskRecord',
  id: 8107302882211129404,
  properties: {
    r'timeStamp': PropertySchema(
      id: 0,
      name: r'timeStamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _dailyTaskRecordEstimateSize,
  serialize: _dailyTaskRecordSerialize,
  deserialize: _dailyTaskRecordDeserialize,
  deserializeProp: _dailyTaskRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyTaskRecordGetId,
  getLinks: _dailyTaskRecordGetLinks,
  attach: _dailyTaskRecordAttach,
  version: '3.0.5',
);

int _dailyTaskRecordEstimateSize(
  DailyTaskRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dailyTaskRecordSerialize(
  DailyTaskRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.timeStamp);
}

DailyTaskRecord _dailyTaskRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyTaskRecord();
  object.id = id;
  object.timeStamp = reader.readDateTimeOrNull(offsets[0]);
  return object;
}

P _dailyTaskRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyTaskRecordGetId(DailyTaskRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyTaskRecordGetLinks(DailyTaskRecord object) {
  return [];
}

void _dailyTaskRecordAttach(
    IsarCollection<dynamic> col, Id id, DailyTaskRecord object) {
  object.id = id;
}

extension DailyTaskRecordQueryWhereSort
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QWhere> {
  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyTaskRecordQueryWhere
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QWhereClause> {
  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyTaskRecordQueryFilter
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QFilterCondition> {
  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      timeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeStamp',
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      timeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeStamp',
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      timeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      timeStampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      timeStampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterFilterCondition>
      timeStampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeStamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyTaskRecordQueryObject
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QFilterCondition> {}

extension DailyTaskRecordQueryLinks
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QFilterCondition> {}

extension DailyTaskRecordQuerySortBy
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QSortBy> {
  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterSortBy>
      sortByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterSortBy>
      sortByTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.desc);
    });
  }
}

extension DailyTaskRecordQuerySortThenBy
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QSortThenBy> {
  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterSortBy>
      thenByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QAfterSortBy>
      thenByTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.desc);
    });
  }
}

extension DailyTaskRecordQueryWhereDistinct
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QDistinct> {
  QueryBuilder<DailyTaskRecord, DailyTaskRecord, QDistinct>
      distinctByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeStamp');
    });
  }
}

extension DailyTaskRecordQueryProperty
    on QueryBuilder<DailyTaskRecord, DailyTaskRecord, QQueryProperty> {
  QueryBuilder<DailyTaskRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyTaskRecord, DateTime?, QQueryOperations>
      timeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeStamp');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIncrementTrackerRecordCollection on Isar {
  IsarCollection<IncrementTrackerRecord> get incrementTrackerRecords =>
      this.collection();
}

const IncrementTrackerRecordSchema = CollectionSchema(
  name: r'IncrementTrackerRecord',
  id: 1088720010174450589,
  properties: {
    r'timeStamp': PropertySchema(
      id: 0,
      name: r'timeStamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _incrementTrackerRecordEstimateSize,
  serialize: _incrementTrackerRecordSerialize,
  deserialize: _incrementTrackerRecordDeserialize,
  deserializeProp: _incrementTrackerRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'tracker': LinkSchema(
      id: 8029786033141952853,
      name: r'tracker',
      target: r'TrackerInstance',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _incrementTrackerRecordGetId,
  getLinks: _incrementTrackerRecordGetLinks,
  attach: _incrementTrackerRecordAttach,
  version: '3.0.5',
);

int _incrementTrackerRecordEstimateSize(
  IncrementTrackerRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _incrementTrackerRecordSerialize(
  IncrementTrackerRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.timeStamp);
}

IncrementTrackerRecord _incrementTrackerRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IncrementTrackerRecord();
  object.id = id;
  object.timeStamp = reader.readDateTimeOrNull(offsets[0]);
  return object;
}

P _incrementTrackerRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _incrementTrackerRecordGetId(IncrementTrackerRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _incrementTrackerRecordGetLinks(
    IncrementTrackerRecord object) {
  return [object.tracker];
}

void _incrementTrackerRecordAttach(
    IsarCollection<dynamic> col, Id id, IncrementTrackerRecord object) {
  object.id = id;
  object.tracker
      .attach(col, col.isar.collection<TrackerInstance>(), r'tracker', id);
}

extension IncrementTrackerRecordQueryWhereSort
    on QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QWhere> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IncrementTrackerRecordQueryWhere on QueryBuilder<
    IncrementTrackerRecord, IncrementTrackerRecord, QWhereClause> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IncrementTrackerRecordQueryFilter on QueryBuilder<
    IncrementTrackerRecord, IncrementTrackerRecord, QFilterCondition> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> timeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeStamp',
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> timeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeStamp',
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> timeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> timeStampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> timeStampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> timeStampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeStamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IncrementTrackerRecordQueryObject on QueryBuilder<
    IncrementTrackerRecord, IncrementTrackerRecord, QFilterCondition> {}

extension IncrementTrackerRecordQueryLinks on QueryBuilder<
    IncrementTrackerRecord, IncrementTrackerRecord, QFilterCondition> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> tracker(FilterQuery<TrackerInstance> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tracker');
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord,
      QAfterFilterCondition> trackerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracker', 0, true, 0, true);
    });
  }
}

extension IncrementTrackerRecordQuerySortBy
    on QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QSortBy> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterSortBy>
      sortByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.asc);
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterSortBy>
      sortByTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.desc);
    });
  }
}

extension IncrementTrackerRecordQuerySortThenBy on QueryBuilder<
    IncrementTrackerRecord, IncrementTrackerRecord, QSortThenBy> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterSortBy>
      thenByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.asc);
    });
  }

  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QAfterSortBy>
      thenByTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.desc);
    });
  }
}

extension IncrementTrackerRecordQueryWhereDistinct
    on QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QDistinct> {
  QueryBuilder<IncrementTrackerRecord, IncrementTrackerRecord, QDistinct>
      distinctByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeStamp');
    });
  }
}

extension IncrementTrackerRecordQueryProperty on QueryBuilder<
    IncrementTrackerRecord, IncrementTrackerRecord, QQueryProperty> {
  QueryBuilder<IncrementTrackerRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IncrementTrackerRecord, DateTime?, QQueryOperations>
      timeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeStamp');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTrackerInstanceCollection on Isar {
  IsarCollection<TrackerInstance> get trackerInstances => this.collection();
}

const TrackerInstanceSchema = CollectionSchema(
  name: r'TrackerInstance',
  id: 7627891768736059807,
  properties: {
    r'instanceJson': PropertySchema(
      id: 0,
      name: r'instanceJson',
      type: IsarType.string,
    )
  },
  estimateSize: _trackerInstanceEstimateSize,
  serialize: _trackerInstanceSerialize,
  deserialize: _trackerInstanceDeserialize,
  deserializeProp: _trackerInstanceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _trackerInstanceGetId,
  getLinks: _trackerInstanceGetLinks,
  attach: _trackerInstanceAttach,
  version: '3.0.5',
);

int _trackerInstanceEstimateSize(
  TrackerInstance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.instanceJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trackerInstanceSerialize(
  TrackerInstance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.instanceJson);
}

TrackerInstance _trackerInstanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TrackerInstance();
  object.id = id;
  object.instanceJson = reader.readStringOrNull(offsets[0]);
  return object;
}

P _trackerInstanceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _trackerInstanceGetId(TrackerInstance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _trackerInstanceGetLinks(TrackerInstance object) {
  return [];
}

void _trackerInstanceAttach(
    IsarCollection<dynamic> col, Id id, TrackerInstance object) {
  object.id = id;
}

extension TrackerInstanceQueryWhereSort
    on QueryBuilder<TrackerInstance, TrackerInstance, QWhere> {
  QueryBuilder<TrackerInstance, TrackerInstance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TrackerInstanceQueryWhere
    on QueryBuilder<TrackerInstance, TrackerInstance, QWhereClause> {
  QueryBuilder<TrackerInstance, TrackerInstance, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TrackerInstanceQueryFilter
    on QueryBuilder<TrackerInstance, TrackerInstance, QFilterCondition> {
  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instanceJson',
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instanceJson',
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instanceJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instanceJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instanceJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instanceJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instanceJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instanceJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instanceJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceJson',
        value: '',
      ));
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterFilterCondition>
      instanceJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instanceJson',
        value: '',
      ));
    });
  }
}

extension TrackerInstanceQueryObject
    on QueryBuilder<TrackerInstance, TrackerInstance, QFilterCondition> {}

extension TrackerInstanceQueryLinks
    on QueryBuilder<TrackerInstance, TrackerInstance, QFilterCondition> {}

extension TrackerInstanceQuerySortBy
    on QueryBuilder<TrackerInstance, TrackerInstance, QSortBy> {
  QueryBuilder<TrackerInstance, TrackerInstance, QAfterSortBy>
      sortByInstanceJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceJson', Sort.asc);
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterSortBy>
      sortByInstanceJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceJson', Sort.desc);
    });
  }
}

extension TrackerInstanceQuerySortThenBy
    on QueryBuilder<TrackerInstance, TrackerInstance, QSortThenBy> {
  QueryBuilder<TrackerInstance, TrackerInstance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterSortBy>
      thenByInstanceJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceJson', Sort.asc);
    });
  }

  QueryBuilder<TrackerInstance, TrackerInstance, QAfterSortBy>
      thenByInstanceJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceJson', Sort.desc);
    });
  }
}

extension TrackerInstanceQueryWhereDistinct
    on QueryBuilder<TrackerInstance, TrackerInstance, QDistinct> {
  QueryBuilder<TrackerInstance, TrackerInstance, QDistinct>
      distinctByInstanceJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instanceJson', caseSensitive: caseSensitive);
    });
  }
}

extension TrackerInstanceQueryProperty
    on QueryBuilder<TrackerInstance, TrackerInstance, QQueryProperty> {
  QueryBuilder<TrackerInstance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TrackerInstance, String?, QQueryOperations>
      instanceJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instanceJson');
    });
  }
}
