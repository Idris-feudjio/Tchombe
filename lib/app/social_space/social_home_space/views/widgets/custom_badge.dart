import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 42,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 40,
              ),
            ),
          );
        });
  }
}
