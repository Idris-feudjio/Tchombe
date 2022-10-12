import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/social_space/data/dummy_data.dart';
import 'package:tchombe/app/social_space/models/publisher_model.dart';
import 'package:tchombe/app/social_space/social_home_space/views/social_account.dart';

class CustomPublisher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: DummyDataOfSocialSpace.publisherList
            .map((_publisher) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(radius: 25),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              _publisher.account.accName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_publisher.date,
                                  style: TextStyle(fontWeight: FontWeight.w300)),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () => Get.to(() => SocialAccount(account: _publisher.account,)),
                          child: Card(
                            child: Image.asset(_publisher.pubContent.imageUri),
                          ),
                        )
                      ],
                    ),
                  ),
            ))
            .toList(),
      ),
    );
  }
}
