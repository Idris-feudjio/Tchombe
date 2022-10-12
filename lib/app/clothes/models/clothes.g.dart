// GENERATED CODE - DO NOT MODIFY BY HAND

part of clothes;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Clothes> _$clothesSerializer = new _$ClothesSerializer();

class _$ClothesSerializer implements StructuredSerializer<Clothes> {
  @override
  final Iterable<Type> types = const [Clothes, _$Clothes];
  @override
  final String wireName = 'Clothes';

  @override
  Iterable<Object?> serialize(Serializers serializers, Clothes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'imageUri',
      serializers.serialize(object.imageUri,
          specifiedType: const FullType(String)),
      'brand',
      serializers.serialize(object.brand,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.clothesId;
    if (value != null) {
      result
        ..add('clothesId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clothesType;
    if (value != null) {
      result
        ..add('clothesType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clothesDescription;
    if (value != null) {
      result
        ..add('clothesDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.clothesName;
    if (value != null) {
      result
        ..add('clothesName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Clothes deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClothesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clothesId':
          result.clothesId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUri':
          result.imageUri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clothesType':
          result.clothesType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clothesDescription':
          result.clothesDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'clothesName':
          result.clothesName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Clothes extends Clothes {
  @override
  final String? clothesId;
  @override
  final String imageUri;
  @override
  final String brand;
  @override
  final String? clothesType;
  @override
  final String? color;
  @override
  final String? clothesDescription;
  @override
  final double? price;
  @override
  final String? clothesName;

  factory _$Clothes([void Function(ClothesBuilder)? updates]) =>
      (new ClothesBuilder()..update(updates)).build();

  _$Clothes._(
      {this.clothesId,
      required this.imageUri,
      required this.brand,
      this.clothesType,
      this.color,
      this.clothesDescription,
      this.price,
      this.clothesName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(imageUri, 'Clothes', 'imageUri');
    BuiltValueNullFieldError.checkNotNull(brand, 'Clothes', 'brand');
  }

  @override
  Clothes rebuild(void Function(ClothesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClothesBuilder toBuilder() => new ClothesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Clothes &&
        clothesId == other.clothesId &&
        imageUri == other.imageUri &&
        brand == other.brand &&
        clothesType == other.clothesType &&
        color == other.color &&
        clothesDescription == other.clothesDescription &&
        price == other.price &&
        clothesName == other.clothesName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, clothesId.hashCode), imageUri.hashCode),
                            brand.hashCode),
                        clothesType.hashCode),
                    color.hashCode),
                clothesDescription.hashCode),
            price.hashCode),
        clothesName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Clothes')
          ..add('clothesId', clothesId)
          ..add('imageUri', imageUri)
          ..add('brand', brand)
          ..add('clothesType', clothesType)
          ..add('color', color)
          ..add('clothesDescription', clothesDescription)
          ..add('price', price)
          ..add('clothesName', clothesName))
        .toString();
  }
}

class ClothesBuilder implements Builder<Clothes, ClothesBuilder> {
  _$Clothes? _$v;

  String? _clothesId;
  String? get clothesId => _$this._clothesId;
  set clothesId(String? clothesId) => _$this._clothesId = clothesId;

  String? _imageUri;
  String? get imageUri => _$this._imageUri;
  set imageUri(String? imageUri) => _$this._imageUri = imageUri;

  String? _brand;
  String? get brand => _$this._brand;
  set brand(String? brand) => _$this._brand = brand;

  String? _clothesType;
  String? get clothesType => _$this._clothesType;
  set clothesType(String? clothesType) => _$this._clothesType = clothesType;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _clothesDescription;
  String? get clothesDescription => _$this._clothesDescription;
  set clothesDescription(String? clothesDescription) =>
      _$this._clothesDescription = clothesDescription;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _clothesName;
  String? get clothesName => _$this._clothesName;
  set clothesName(String? clothesName) => _$this._clothesName = clothesName;

  ClothesBuilder();

  ClothesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clothesId = $v.clothesId;
      _imageUri = $v.imageUri;
      _brand = $v.brand;
      _clothesType = $v.clothesType;
      _color = $v.color;
      _clothesDescription = $v.clothesDescription;
      _price = $v.price;
      _clothesName = $v.clothesName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Clothes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Clothes;
  }

  @override
  void update(void Function(ClothesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Clothes build() {
    final _$result = _$v ??
        new _$Clothes._(
            clothesId: clothesId,
            imageUri: BuiltValueNullFieldError.checkNotNull(
                imageUri, 'Clothes', 'imageUri'),
            brand: BuiltValueNullFieldError.checkNotNull(
                brand, 'Clothes', 'brand'),
            clothesType: clothesType,
            color: color,
            clothesDescription: clothesDescription,
            price: price,
            clothesName: clothesName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
