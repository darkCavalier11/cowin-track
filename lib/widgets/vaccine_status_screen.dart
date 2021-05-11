import 'package:cowin/provider/vaccine.dart';
import 'package:cowin/widgets/no_vaccine.dart';
import 'package:cowin/widgets/vaccine_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VaccineStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Vaccine> locations =
        Provider.of<VaccineProvider>(context).fetchLocation;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: locations.isEmpty
          ? NoVaccine()
          : ListView.builder(
              itemBuilder: (ctx, i) => Container(
                child: ListTile(
                  title: VaccineList(locations[i]),
                ),
              ),
              itemCount: locations.length,
            ),
    );
  }
}
