import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tchombe/core/model/abstract_dto.dart';
import 'package:tchombe/serializers/serializers.dart';

class AbstractSummaryDto<T extends AbstractDto> {
 final int? id;
 final T? value;

  AbstractSummaryDto(this.value,this.id);


}
