import 'package:built_collection/src/list.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:built_collection/built_collection.dart';
import 'package:tchombe/app/planification/models/planning.dart';

class ListOfPlanning {
  static final List<Planning> planningList = [
    Planning((p) => p
      ..date = '15/02/2022'
      ..event = 'Mariage de Franky'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look7.jpg'
        ..description =
            'premier'
        ..costOfALook = 12).toBuilder()),
    Planning((p) => p
      ..date = '16/02/2022'
      ..event = 'Sorie amicale'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look8.jpg'
        ..description =
            'troisieme'
        ..costOfALook = 12).toBuilder()),
    Planning((p) => p
      ..date = '16/02/2022'
      ..event = 'En route pour l\'ecole'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look5.jpg'
        ..description =
            'troisieme'
        ..costOfALook = 12).toBuilder()),
    Planning((p) => p
      ..date = '25/02/2022'
      ..event = 'En route pour l\'ecole'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look5.jpg'
        ..description =
            'troisieme'
        ..costOfALook = 12).toBuilder()),
    Planning((p) => p
      ..date = '26/02/2022'
      ..event = 'Soirée danssante'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look2.jpg'
        ..description =
            'quatrième'
        ..costOfALook = 12).toBuilder()),
    Planning((p) => p
      ..date = '22/02/2022'
      ..event = 'Soirée danssante'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look2.jpg'
        ..description =
            'quatrième'
        ..costOfALook = 12).toBuilder()),
    Planning((p) => p
      ..date = '26/02/2022'
      ..event = 'Soirée chicha'
      ..lookAssociated = Look((b) => b
        ..imageUri = 'assets/images/look_images/look8.jpg'
        ..description =
            'cinquième'
        ..costOfALook = 12).toBuilder())
  ];
}
