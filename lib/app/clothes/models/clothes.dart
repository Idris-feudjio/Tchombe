library clothes;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tchombe/core/model/abstract_dto.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';
import 'package:tchombe/serializers/serializers.dart';

part 'clothes.g.dart';

abstract class Clothes implements Built<Clothes, ClothesBuilder>, AbstractDto {
  Clothes._();

  factory Clothes([updates(ClothesBuilder b)]) = _$Clothes;

  String? get clothesId;

  String get imageUri;

  String get brand;

  String? get clothesType;

  String? get color;

  String? get clothesDescription;

  double? get price;

  String? get clothesName;

  String toJson() {
    return json.encode(serializers.serializeWith(Clothes.serializer, this));
  }

  Map<String, dynamic>? toJsonMap() {
    return serializers.serializeWith(Clothes.serializer, this)
        as Map<String, dynamic>;
  }

  static Clothes? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Clothes.serializer, json.decode(jsonString));
  }

  static Clothes fromJsonMap(Map<String, dynamic> json) {
    return serializers.deserializeWith(Clothes.serializer, json) as Clothes;
  }

  @override
  Clothes? toSummaryDto(String jsonString) => Clothes.fromJson(jsonString);

  static Serializer<Clothes> get serializer => _$clothesSerializer;
}

class ClothesSummary {
  final AbstractSummaryDto<Clothes> summary;

  ClothesSummary(this.summary);
}
