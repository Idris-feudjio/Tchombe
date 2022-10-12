import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/social_space/models/account_model.dart';

class Publisher {
  int? pubId;
  String date;
  Look pubContent;
  String? comment;
  Account account;

  Publisher(
      {this.pubId,
      required this.date,
     required this.pubContent,
      required this.account,
      this.comment});
}
