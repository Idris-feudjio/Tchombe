import 'package:built_collection/src/list.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/social_space/models/account_model.dart';
import 'package:tchombe/app/social_space/models/internaute_model.dart';
import 'package:tchombe/app/social_space/models/publisher_model.dart';

class DummyDataOfSocialSpace {
  static List<Publisher> publisherList = [
    Publisher(
        date: '12/102021',
        pubContent:
            Look((l) => l..imageUri = 'assets/images/look_images/look2.jpg'
/*            ..listOfClothes = [
              Clothes((c) => c
                ..imageUri = 'assets/images/look_images/look2.jpg'
                ..brand = 'Lacoste'
                ..price = 1200),
              Clothes((c) => c
                ..imageUri = 'assets/images/look_images/look5.jpg'
                ..brand = 'LongChamp'
                ..price = 1200)
            ] as ListBuilder<Clothes>?)*/
                ),
        comment: 'j\'apprecie ce magnifique look idris',
        account: Account(
            accName: 'Tcombe Space',
            interNaute: InterNaute(
                inerPhone: 6550550898,
                interName: 'idris Feudjio',
                interAddress: 'Logbessou',
                interGender: 'M'))),
    Publisher(
        date: '02/06/2021',
        pubContent: Look(
            (l) => l..imageUri = 'assets/images/look_images/look5.jpg'
            /*        ..listOfClothes = [
              Clothes((c) => c
                ..imageUri = 'assets/images/look_images/look5.jpg'
                ..brand = 'Lacoste'
                ..price = 1200),
              Clothes((c) => c
                ..imageUri = 'assets/images/look_images/look1.jpg'
                ..brand = 'LongChamp'
                ..price = 1200)
            ] as ListBuilder<Clothes>?*/
            ),
        comment: 'manifique',
        account: Account(
            accName: 'Dadju Space',
            interNaute: InterNaute(
                inerPhone: 677804080,
                interName: 'Dadju Bogning',
                interAddress: 'Paris',
                interGender: 'F'))),
    Publisher(
        date: '02/06/2021',
        pubContent: Look(
            (l) => l..imageUri = 'assets/images/look_images/look7.jpg'
            /*        ..listOfClothes = [
              Clothes((c) => c
                ..imageUri = 'assets/images/look_images/look5.jpg'
                ..brand = 'Lacoste'
                ..price = 1200),
              Clothes((c) => c
                ..imageUri = 'assets/images/look_images/look1.jpg'
                ..brand = 'LongChamp'
                ..price = 1200)
            ] as ListBuilder<Clothes>?*/
            ),
        comment: 'manifique',
        account: Account(
            accName: 'Ju Ju',
            interNaute: InterNaute(
                inerPhone: 677804080,
                interName: 'Cedric Kamdem',
                interAddress: 'Hopital Generale',
                interGender: 'F')))
  ];
}
