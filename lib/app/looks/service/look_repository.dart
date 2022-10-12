import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/core/db_helper/tchombe_abstract_dao.dart';

class LookRepository extends TchombeAbstractDao<Look> {
  LookRepository();

  @override
  Look? toSummaryDto(dynamic json) {
    return Look.fromJsonMap(json);
  }
}