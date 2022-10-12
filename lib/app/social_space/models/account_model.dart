import 'package:tchombe/app/social_space/models/internaute_model.dart';

class Account {
  Account({this.accId, required this.accName, required this.interNaute});

  int? accId;
  String accName;
  InterNaute interNaute;
}
