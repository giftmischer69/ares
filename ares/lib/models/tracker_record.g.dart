// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTrackerRecordCollection on Isar {
  IsarCollection<TrackerRecord> get trackerRecords => this.collection();
}

const TrackerRecordSchema = CollectionSchema(
  name: r'TrackerRecord',
  id: 200652569352162845,
  properties: {
    r'timeStamp': PropertySchema(
      id: 0,
      name: r'timeStamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _trackerRecordEstimateSize,
  serialize: _trackerRecordSerialize,
  deserialize: _trackerRecordDeserialize,
  deserializeProp: _trackerRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'parent': LinkSchema(
      id: -5687343029672823679,
      name: r'parent',
      target: r'Tracker',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _trackerRecordGetId,
  getLinks: _trackerRecordGetLinks,
  attach: _trackerRecordAttach,
  version: '3.0.5',
);

int _trackerRecordEstimateSize(
  TrackerRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _trackerRecordSerialize(
  TrackerRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.timeStamp);
}

TrackerRecord _trackerRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TrackerRecord();
  object.id = id;
  object.timeStamp = reader.readDateTime(offsets[0]);
  return object;
}

P _trackerRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _trackerRecordGetId(TrackerRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _trackerRecordGetLinks(TrackerRecord object) {
  return [object.parent];
}

void _trackerRecordAttach(
    IsarCollection<dynamic> col, Id id, TrackerRecord object) {
  object.id = id;
  object.parent.attach(col, col.isar.collection<Tracker>(), r'parent', id);
}

extension TrackerRecordQueryWhereSort
    on QueryBuilder<TrackerRecord, TrackerRecord, QWhere> {
  QueryBuilder<TrackerRecord, TrackerRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TrackerRecordQueryWhere
    on QueryBuilder<TrackerRecord, TrackerRecord, QWhereClause> {
  QueryBuilder<TrackerRecord, TrackerRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterWhereClause> idBetween(
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

extension TrackerRecordQueryFilter
    on QueryBuilder<TrackerRecord, TrackerRecord, QFilterCondition> {
  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition>
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

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition>
      timeStampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition>
      timeStampGreaterThan(
    DateTime value, {
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

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition>
      timeStampLessThan(
    DateTime value, {
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

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition>
      timeStampBetween(
    DateTime lower,
    DateTime upper, {
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

extension TrackerRecordQueryObject
    on QueryBuilder<TrackerRecord, TrackerRecord, QFilterCondition> {}

extension TrackerRecordQueryLinks
    on QueryBuilder<TrackerRecord, TrackerRecord, QFilterCondition> {
  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition> parent(
      FilterQuery<Tracker> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'parent');
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterFilterCondition>
      parentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'parent', 0, true, 0, true);
    });
  }
}

extension TrackerRecordQuerySortBy
    on QueryBuilder<TrackerRecord, TrackerRecord, QSortBy> {
  QueryBuilder<TrackerRecord, TrackerRecord, QAfterSortBy> sortByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.asc);
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterSortBy>
      sortByTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.desc);
    });
  }
}

extension TrackerRecordQuerySortThenBy
    on QueryBuilder<TrackerRecord, TrackerRecord, QSortThenBy> {
  QueryBuilder<TrackerRecord, TrackerRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterSortBy> thenByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.asc);
    });
  }

  QueryBuilder<TrackerRecord, TrackerRecord, QAfterSortBy>
      thenByTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStamp', Sort.desc);
    });
  }
}

extension TrackerRecordQueryWhereDistinct
    on QueryBuilder<TrackerRecord, TrackerRecord, QDistinct> {
  QueryBuilder<TrackerRecord, TrackerRecord, QDistinct> distinctByTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeStamp');
    });
  }
}

extension TrackerRecordQueryProperty
    on QueryBuilder<TrackerRecord, TrackerRecord, QQueryProperty> {
  QueryBuilder<TrackerRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TrackerRecord, DateTime, QQueryOperations> timeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeStamp');
    });
  }
}
