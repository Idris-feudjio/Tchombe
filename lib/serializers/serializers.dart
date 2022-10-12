library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Clothes,
  Planning,
  Look,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();
