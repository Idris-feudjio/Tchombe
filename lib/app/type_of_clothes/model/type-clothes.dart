import 'package:get/get.dart';

enum TypeEnumClothes {
  ALL,
  HIGH,
  JEWELRY,
  BAG,
  BOTTOM,
  SHOE,
  ACCESSORIES,
  OTHER,
  WORK
}

extension TypeEnumClothesExtension on TypeEnumClothes {
  String get getClothesTitle {
    switch (this) {
      case TypeEnumClothes.HIGH:
        return 'K_TOP'.tr;

      case TypeEnumClothes.BOTTOM:
        return 'K_BOTTOM'.tr;

      case TypeEnumClothes.SHOE:
        return 'K_SHOES'.tr;

      case TypeEnumClothes.BAG:
        return 'K_BAG'.tr;
      case TypeEnumClothes.JEWELRY:
        return 'K_JEWELRY'.tr;
      case TypeEnumClothes.OTHER:
        return 'K_OTHER'.tr;

      case TypeEnumClothes.ACCESSORIES:
        return 'K_ACCESSORY'.tr;

      default:
        return 'K_ALL'.tr;
    }
  }


  static final List<String> listTypeClothes = [
    'K_JEWELRY',
    'K_TOP',
    'K_BOTTOM',
    'K_BAG',
    'K_SHOES',
    'K_ACCESSORY',
    'K_OTHER',
  ];

  static final List<TypeEnumClothes> typeClothes = [
    TypeEnumClothes.ALL,
    TypeEnumClothes.HIGH,
    TypeEnumClothes.BOTTOM,
    TypeEnumClothes.SHOE,
    TypeEnumClothes.BAG,
    TypeEnumClothes.JEWELRY,
    TypeEnumClothes.ACCESSORIES,
    TypeEnumClothes.OTHER,
  ];

  static getTabBarTypeClothes(int index) => typeClothes[index];
}
