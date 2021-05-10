import 'package:flutter/material.dart';

class NoVaccine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no-vaccines.png',
            height: 100,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'No Vaccine center at this location!',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
