import 'package:flutter/material.dart';

class VaccineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 230,
      alignment: Alignment.center,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Divider(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            child: ListTile(
              leading: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/vaccine.png'),
              ),
              title: Column(
                children: [
                  Text('Debabhuin'),
                  Text('Narsinghpur'),
                  Text('Cuttack, Odisha'),
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
                label: Text('Free'),
              ),
              SizedBox(
                width: 15,
              ),
              Chip(
                backgroundColor: Colors.greenAccent,
                label: Text('Covishield'),
              ),
              SizedBox(
                width: 15,
              ),
              Chip(
                backgroundColor: Colors.greenAccent,
                label: Text('45+'),
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
                    label: Text("08:00AM - 10:00AM"),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              itemCount: 4,
            ),
          )
        ],
      ),
    );
  }
}
