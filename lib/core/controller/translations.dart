import 'package:get/get.dart';
import 'package:tchombe/utils/texts/en_us.dart';
import 'package:tchombe/utils/texts/fr_Fr.dart';

class TchombeMessage extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'fr_FR':TranslationFr.translation,
    'en_US':TranslationEn.translation
  };

}