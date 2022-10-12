import 'package:get/get.dart';

enum LookCategory {
  ALL,
  WEDDING,
  EVENING,
  OUTDOOR,
  CLASS,
  HOME,
  PARTY,
  OTHER,
  WORK
}

extension LookCategoryExtension on LookCategory {
  String get name {
    switch (this) {
      case LookCategory.OTHER:
        return 'K_OTHER'.tr;

      case LookCategory.CLASS:
        return 'K_CLASS'.tr;

      case LookCategory.PARTY:
        return 'K_HOLLY_DAY'.tr;

      case LookCategory.HOME:
        return 'K_HOUSE'.tr;

      case LookCategory.EVENING:
        return 'K_EVENING'.tr;

      case LookCategory.WEDDING:
        return 'K_MARIAGE'.tr;

      case LookCategory.OUTDOOR:
        return 'K_OUTSIDE'.tr;

      case LookCategory.WORK:
        return 'K_WORK'.tr;

      default:
        return 'K_ALL'.tr;
    }
  }

  static final List<LookCategory> lookCategory = [
    LookCategory.ALL,
    LookCategory.WEDDING,
    LookCategory.EVENING,
    LookCategory.CLASS,
    LookCategory.HOME,
    LookCategory.PARTY,
    LookCategory.WORK,
    LookCategory.OUTDOOR,
    LookCategory.OTHER,
  ];

  static getLookByCategory(int index) => lookCategory[index];
}
