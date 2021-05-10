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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
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
