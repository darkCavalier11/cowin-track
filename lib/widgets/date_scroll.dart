import 'dart:convert';

import 'package:cowin/provider/current_state.dart';
import 'package:cowin/provider/vaccine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class DateScroll extends StatefulWidget {
  @override
  _DateScrollState createState() => _DateScrollState();
}

class _DateScrollState extends State<DateScroll> {
  @override
  List<DateTime> _dates = [];
  List<Vaccine> _locations = [];
  final List<bool> _isActive = [];
  void initState() {
    for (var i = 0; i < 10; i++) {
      _dates.add(
        DateTime.now().add(
          Duration(days: i),
        ),
      );
      _isActive.add(false);
    }
    _isActive[0] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 27, right: 27),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isActive[i] ? Colors.white : null,
            borderRadius: _isActive[i]
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: GestureDetector(
            onTap: () async {
              setState(
                () {
                  _isActive.fillRange(0, _isActive.length, false);
                  _isActive[i] = true;
                },
              );
              final pincode =
                  Provider.of<CurrentStateProvider>(context, listen: false).pin;
              final dateTime = _dates[i];
              Provider.of<VaccineProvider>(context, listen: false).init(dateTime, pincode);
            },
            child: Text(
              DateFormat.yMEd().format(_dates[i]),
              style: TextStyle(
                fontSize: 18,
                color: _isActive[i] ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
        itemCount: _dates.length,
      ),
    );
  }
}
