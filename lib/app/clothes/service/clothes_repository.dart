import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/core/db_helper/tchombe_abstract_dao.dart';

class ClothesRepository extends TchombeAbstractDao<Clothes> {
  ClothesRepository();

  @override
  Clothes? toSummaryDto(dynamic json) {
    return Clothes.fromJsonMap(json);
  }
}
