import 'package:flutter/material.dart';
import 'package:tchombe/app/social_space/models/account_model.dart';

class CustomSliverAppBarToAccount extends StatelessWidget {
  final Account account;

  const CustomSliverAppBarToAccount({Key? key, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: CircleAvatar(
        radius: 40,
      ),
      pinned: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Abonne toi'),
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(5),
                primary: Colors.white,
                backgroundColor: Colors.deepOrangeAccent),
          ),
        )
      ],
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(account.accName,
            style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
    );
  }
}
