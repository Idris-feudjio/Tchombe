library Look;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tchombe/core/model/abstract_dto.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';
import 'package:tchombe/serializers/serializers.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:built_collection/built_collection.dart';

part 'look.g.dart';

abstract class Look implements Built<Look, LookBuilder>, AbstractDto {
  Look._();

  factory Look([updates(LookBuilder b)]) = _$Look;

  String? get lookId;

  String get imageUri;

  BuiltList<Clothes>? get listOfClothes;

  BuiltList<String> get listOfCategory;

  String? get description;

  double? get costOfALook;

  String toJson() {
    return json.encode(serializers.serializeWith(Look.serializer, this));
  }

  Map<String, dynamic>? toJsonMap() {
    return serializers.serializeWith(Look.serializer, this)
        as Map<String, dynamic>;
  }

  static Look? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Look.serializer, json.decode(jsonString));
  }

  static Look fromJsonMap(Map<String, dynamic> json) {
    return serializers.deserializeWith(Look.serializer, json) as Look;
  }

  @override
  Look? toSummaryDto(String jsonString) => Look.fromJson(jsonString);

  static Serializer<Look> get serializer => _$lookSerializer;
}

class LookSummary {
  final AbstractSummaryDto<Look> summary;

  LookSummary(this.summary);
}
