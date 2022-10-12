library Planning;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/core/model/abstract_dto.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';
import 'package:tchombe/serializers/serializers.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:built_collection/built_collection.dart';

part 'planning.g.dart';

abstract class Planning
    implements Built<Planning, PlanningBuilder>, AbstractDto {
  Planning._();

  factory Planning([updates(PlanningBuilder b)]) = _$Planning;

  String get date;

  String get event;

  Look get lookAssociated;

 // int get lookId;

  String toJson() {
    return json.encode(serializers.serializeWith(Planning.serializer, this));
  }

  Map<String, dynamic>? toJsonMap() {
    return serializers.serializeWith(Planning.serializer, this)
        as Map<String, dynamic>;
  }

  static Planning? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Planning.serializer, json.decode(jsonString));
  }

  static Planning fromJsonMap(Map<String, dynamic> json) {
    return serializers.deserializeWith(Planning.serializer, json) as Planning;
  }

  @override
  Planning? toSummaryDto(String jsonString) => Planning.fromJson(jsonString);

  static Serializer<Planning> get serializer => _$planningSerializer;
}

class PlanningSummary {
  final AbstractSummaryDto<Planning> summary;

  PlanningSummary(this.summary);
}
