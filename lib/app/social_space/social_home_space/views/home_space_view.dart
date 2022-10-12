import 'package:flutter/material.dart';
import 'package:tchombe/app/social_space/social_home_space/views/widgets/custom_publisher.dart';
import 'package:tchombe/app/social_space/social_home_space/views/widgets/sliver_app_bar.dart';

class SocialSpaceViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          CustomPublisher(),
        ],
      )


    );
  }
}
