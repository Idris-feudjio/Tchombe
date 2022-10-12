import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/core/db_helper/tchombe_abstract_dao.dart';

class PlanningRepository extends TchombeAbstractDao<Planning> {
  PlanningRepository();

  @override
  Planning? toSummaryDto(dynamic json) {
    return Planning.fromJsonMap(json);
  }
}