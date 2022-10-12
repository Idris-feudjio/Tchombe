import 'package:flutter/material.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class CustomSliverPublisherInAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              child: Card(
                child: Image.asset(TchombeAsset.IMG_SECOND_SPLASH_SCREEN),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Card(
                      child: Image.asset(TchombeAsset.IMG_LOGO),
                    );
                  }),
            ),
            Container(
              color: Colors.grey,
              height: 50,
              alignment: Alignment.topRight,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Chip(
                      label: Text('Idris'),
                    );
                  }),
            ),
            Container(
              child: Text(
                  'Nous en sommes désolés ! Avant d’essayer de résoudre les problèmes, veuillez consulter http://status.slack.com/ — le problème pourrait provenir de notre côté.'),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(color: Colors.grey, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Autres Looks',textAlign: TextAlign.center),
                  )),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Card(
                            child: Image.asset(TchombeAsset.IMG_LOGO),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
