// GENERATED CODE - DO NOT MODIFY BY HAND

part of Planning;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Planning> _$planningSerializer = new _$PlanningSerializer();

class _$PlanningSerializer implements StructuredSerializer<Planning> {
  @override
  final Iterable<Type> types = const [Planning, _$Planning];
  @override
  final String wireName = 'Planning';

  @override
  Iterable<Object?> serialize(Serializers serializers, Planning object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'event',
      serializers.serialize(object.event,
          specifiedType: const FullType(String)),
      'lookAssociated',
      serializers.serialize(object.lookAssociated,
          specifiedType: const FullType(Look)),
    ];

    return result;
  }

  @override
  Planning deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlanningBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event':
          result.event = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lookAssociated':
          result.lookAssociated.replace(serializers.deserialize(value,
              specifiedType: const FullType(Look))! as Look);
          break;
      }
    }

    return result.build();
  }
}

class _$Planning extends Planning {
  @override
  final String date;
  @override
  final String event;
  @override
  final Look lookAssociated;

  factory _$Planning([void Function(PlanningBuilder)? updates]) =>
      (new PlanningBuilder()..update(updates)).build();

  _$Planning._(
      {required this.date, required this.event, required this.lookAssociated})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, 'Planning', 'date');
    BuiltValueNullFieldError.checkNotNull(event, 'Planning', 'event');
    BuiltValueNullFieldError.checkNotNull(
        lookAssociated, 'Planning', 'lookAssociated');
  }

  @override
  Planning rebuild(void Function(PlanningBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlanningBuilder toBuilder() => new PlanningBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Planning &&
        date == other.date &&
        event == other.event &&
        lookAssociated == other.lookAssociated;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, date.hashCode), event.hashCode), lookAssociated.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Planning')
          ..add('date', date)
          ..add('event', event)
          ..add('lookAssociated', lookAssociated))
        .toString();
  }
}

class PlanningBuilder implements Builder<Planning, PlanningBuilder> {
  _$Planning? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _event;
  String? get event => _$this._event;
  set event(String? event) => _$this._event = event;

  LookBuilder? _lookAssociated;
  LookBuilder get lookAssociated =>
      _$this._lookAssociated ??= new LookBuilder();
  set lookAssociated(LookBuilder? lookAssociated) =>
      _$this._lookAssociated = lookAssociated;

  PlanningBuilder();

  PlanningBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _event = $v.event;
      _lookAssociated = $v.lookAssociated.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Planning other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Planning;
  }

  @override
  void update(void Function(PlanningBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Planning build() {
    _$Planning _$result;
    try {
      _$result = _$v ??
          new _$Planning._(
              date: BuiltValueNullFieldError.checkNotNull(
                  date, 'Planning', 'date'),
              event: BuiltValueNullFieldError.checkNotNull(
                  event, 'Planning', 'event'),
              lookAssociated: lookAssociated.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lookAssociated';
        lookAssociated.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Planning', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
