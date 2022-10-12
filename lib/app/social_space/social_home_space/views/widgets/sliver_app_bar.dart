import 'package:flutter/material.dart';
import 'package:tchombe/app/social_space/social_home_space/views/widgets/custom_badge.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    Orientation _orientation = MediaQuery.of(context).orientation;

    return SliverAppBar(
      leadingWidth: leadingWidth30,
      pinned: true,

      expandedHeight: _orientation == Orientation.portrait
          ? _size.height * .21
          : _size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: CustomBadge(),
        collapseMode: CollapseMode.parallax,
        titlePadding: EdgeInsets.only(bottom: 0),
        title: Text(
          'Social Space',
          style: TextStyle(color: Theme.of(context).textTheme.headline5!.color),
        ),
        centerTitle: true,
      ),
    );
  }
}
