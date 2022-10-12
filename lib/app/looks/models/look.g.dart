// GENERATED CODE - DO NOT MODIFY BY HAND

part of Look;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Look> _$lookSerializer = new _$LookSerializer();

class _$LookSerializer implements StructuredSerializer<Look> {
  @override
  final Iterable<Type> types = const [Look, _$Look];
  @override
  final String wireName = 'Look';

  @override
  Iterable<Object?> serialize(Serializers serializers, Look object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'imageUri',
      serializers.serialize(object.imageUri,
          specifiedType: const FullType(String)),
      'listOfCategory',
      serializers.serialize(object.listOfCategory,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.lookId;
    if (value != null) {
      result
        ..add('lookId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listOfClothes;
    if (value != null) {
      result
        ..add('listOfClothes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Clothes)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.costOfALook;
    if (value != null) {
      result
        ..add('costOfALook')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Look deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lookId':
          result.lookId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUri':
          result.imageUri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'listOfClothes':
          result.listOfClothes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Clothes)]))!
              as BuiltList<Object?>);
          break;
        case 'listOfCategory':
          result.listOfCategory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'costOfALook':
          result.costOfALook = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$Look extends Look {
  @override
  final String? lookId;
  @override
  final String imageUri;
  @override
  final BuiltList<Clothes>? listOfClothes;
  @override
  final BuiltList<String> listOfCategory;
  @override
  final String? description;
  @override
  final double? costOfALook;

  factory _$Look([void Function(LookBuilder)? updates]) =>
      (new LookBuilder()..update(updates)).build();

  _$Look._(
      {this.lookId,
      required this.imageUri,
      this.listOfClothes,
      required this.listOfCategory,
      this.description,
      this.costOfALook})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(imageUri, 'Look', 'imageUri');
    BuiltValueNullFieldError.checkNotNull(
        listOfCategory, 'Look', 'listOfCategory');
  }

  @override
  Look rebuild(void Function(LookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LookBuilder toBuilder() => new LookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Look &&
        lookId == other.lookId &&
        imageUri == other.imageUri &&
        listOfClothes == other.listOfClothes &&
        listOfCategory == other.listOfCategory &&
        description == other.description &&
        costOfALook == other.costOfALook;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, lookId.hashCode), imageUri.hashCode),
                    listOfClothes.hashCode),
                listOfCategory.hashCode),
            description.hashCode),
        costOfALook.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Look')
          ..add('lookId', lookId)
          ..add('imageUri', imageUri)
          ..add('listOfClothes', listOfClothes)
          ..add('listOfCategory', listOfCategory)
          ..add('description', description)
          ..add('costOfALook', costOfALook))
        .toString();
  }
}

class LookBuilder implements Builder<Look, LookBuilder> {
  _$Look? _$v;

  String? _lookId;
  String? get lookId => _$this._lookId;
  set lookId(String? lookId) => _$this._lookId = lookId;

  String? _imageUri;
  String? get imageUri => _$this._imageUri;
  set imageUri(String? imageUri) => _$this._imageUri = imageUri;

  ListBuilder<Clothes>? _listOfClothes;
  ListBuilder<Clothes> get listOfClothes =>
      _$this._listOfClothes ??= new ListBuilder<Clothes>();
  set listOfClothes(ListBuilder<Clothes>? listOfClothes) =>
      _$this._listOfClothes = listOfClothes;

  ListBuilder<String>? _listOfCategory;
  ListBuilder<String> get listOfCategory =>
      _$this._listOfCategory ??= new ListBuilder<String>();
  set listOfCategory(ListBuilder<String>? listOfCategory) =>
      _$this._listOfCategory = listOfCategory;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _costOfALook;
  double? get costOfALook => _$this._costOfALook;
  set costOfALook(double? costOfALook) => _$this._costOfALook = costOfALook;

  LookBuilder();

  LookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lookId = $v.lookId;
      _imageUri = $v.imageUri;
      _listOfClothes = $v.listOfClothes?.toBuilder();
      _listOfCategory = $v.listOfCategory.toBuilder();
      _description = $v.description;
      _costOfALook = $v.costOfALook;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Look other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Look;
  }

  @override
  void update(void Function(LookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Look build() {
    _$Look _$result;
    try {
      _$result = _$v ??
          new _$Look._(
              lookId: lookId,
              imageUri: BuiltValueNullFieldError.checkNotNull(
                  imageUri, 'Look', 'imageUri'),
              listOfClothes: _listOfClothes?.build(),
              listOfCategory: listOfCategory.build(),
              description: description,
              costOfALook: costOfALook);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'listOfClothes';
        _listOfClothes?.build();
        _$failedField = 'listOfCategory';
        listOfCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Look', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
