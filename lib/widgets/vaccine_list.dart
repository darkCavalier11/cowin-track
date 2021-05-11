import 'package:cowin/provider/vaccine.dart';
import 'package:cowin/screens/gmap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VaccineList extends StatelessWidget {
  final Vaccine location;

  VaccineList(this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(
            height: 10,
          ),
          Container(
            child: ListTile(
              leading: Image.asset(
                'assets/images/vaccine.png',
                height: 60,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(location.name),
                  Text(location.blockName == 'Not Applicable'
                      ? location.address
                      : location.blockName),
                  Text('${location.districtName}, ${location.stateName}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                color: Colors.deepPurpleAccent,
                splashColor: Colors.deepPurpleAccent,
                onPressed: () {
                  print('Hello');
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Chip(
                backgroundColor: Colors.greenAccent,
                label: Text(location.feeType),
              ),
              SizedBox(
                width: 15,
              ),
              Chip(
                backgroundColor: Colors.greenAccent,
                label: Text(location.vaccine),
              ),
              SizedBox(
                width: 15,
              ),
              Chip(
                backgroundColor: Colors.greenAccent,
                label: Text(location.minAgeLimit.toString() + '+'),
              ),
              Spacer(),
              OutlineButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => GMap(location.lat, location.long),
                    ),
                  );
                },
                child: Text('Map'),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => Row(
                children: [
                  Chip(
                    avatar: Icon(Icons.access_alarm),
                    label: Text(location.slots[i]),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              itemCount: location.slots.length,
            ),
          )
        ],
      ),
    );
  }
}
