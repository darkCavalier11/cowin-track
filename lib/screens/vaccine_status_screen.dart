import 'package:cowin/widgets/vaccine_list.dart';
import 'package:flutter/material.dart';

class VaccineStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Container(
          height: 250,
          child: ListTile(
            title: VaccineList(),
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
