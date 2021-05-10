import 'package:cowin/widgets/vaccine_list.dart';
import 'package:flutter/material.dart';

class VaccineStatus extends StatefulWidget {
  @override
  _VaccineStatusState createState() => _VaccineStatusState();
}

class _VaccineStatusState extends State<VaccineStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemBuilder: (ctx, i) => Container(
          child: ListTile(
            title: VaccineList(),
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
