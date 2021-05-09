import 'package:flutter/material.dart';

class DateScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'date $i',
          style: TextStyle(fontSize: 18),
        ),
      ),
      itemCount: 10,
    );
  }
}
