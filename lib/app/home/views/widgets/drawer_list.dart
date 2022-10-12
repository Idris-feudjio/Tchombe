import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/core/controller/translation_controller.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [OpenDialog()],
      ),
    );
  }
}


class OpenDialog extends StatelessWidget {
  final TranslationController translation = Get.put(TranslationController());

  final List<Map> locales = [
    {'language': 'English', 'locales': Locale('en', 'US')},
    {'language': 'French', 'locales': Locale('fr', 'FR')}
  ];
  showLocalDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('K_CHANGELOCALELANGUAGE'.tr),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          translation.changeLocaleLanguage(
                            locales[index]['locales'],
                          );
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: padding5),
                          child: Text(locales[index]['language']),
                        )),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: locales.length),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(Icons.language),
      onTap: () => showLocalDialog(context),
      title: Text('K_LANGUAGE'.tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      trailing: Icon(Icons.navigate_next),
    );
  }
}
