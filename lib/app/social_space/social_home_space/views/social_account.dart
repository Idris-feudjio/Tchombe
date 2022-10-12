import 'package:flutter/material.dart';
import 'package:tchombe/app/social_space/models/account_model.dart';
import 'package:tchombe/app/social_space/social_home_space/views/widgets/custom_publisher_in_account.dart';
import 'package:tchombe/app/social_space/social_home_space/views/widgets/custom_silver_app_bar_account.dart';
import 'package:tchombe/app/social_space/social_home_space/views/widgets/sliver_app_bar.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class SocialAccount extends StatelessWidget {
  final Account account;

  const SocialAccount({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBarToAccount(account: account),
          CustomSliverPublisherInAccount(),
        ],
      ),
    );
  }
}
