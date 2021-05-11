import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Vaccine {
  String centerId;
  String name;
  String address;
  String stateName;
  String districtName;
  String blockName;
  int lat;
  int long;
  int pincode;
  String feeType;
  int minAgeLimit;
  String vaccine;
  List<dynamic> slots;

  Vaccine({
    this.centerId,
    this.name,
    this.address,
    this.stateName,
    this.districtName,
    this.blockName,
    this.lat,
    this.long,
    this.pincode,
    this.feeType,
    this.minAgeLimit,
    this.vaccine,
    this.slots,
  });

  Vaccine.fromJson(Map<String, dynamic> json) {
    centerId = json['center_id'].toString();
    name = json['name'];
    address = json['address'];
    stateName = json['state_name'];
    districtName = json['district_name'];
    blockName = json['block_name'];
    lat = json['lat'];
    long = json['long'];
    pincode = json['pincode'];
    feeType = json['fee_type'];
    minAgeLimit = json['sessions'][0]['min_age_limit'];
    vaccine = json['sessions'][0]['vaccine'];
    slots = json['sessions'][0]['slots'];
  }
}

class VaccineProvider with ChangeNotifier {
  List<Vaccine> locations = [];

  void init(DateTime date, int pincode) async {
    int day = date.day;
    int month = date.month;
    int year = date.year;
    final String url =
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pincode&date=$day-$month-$year';

    final res = await read(url);
    final data = jsonDecode(res)['centers'];
    locations.clear();
    print(data);
    if (data.length == 0) {
      notifyListeners();
      return;
    }
    for (var i = 0; i < data.length; i++) {
      final String dateAvailable = data[i]['sessions'][0]['date'];
      // if (int.parse(dateAvailable[0] + dateAvailable[1]) != day) {
      //   continue;
      // }
      locations.add(Vaccine.fromJson(data[i]));
    }
    notifyListeners();
  }

  List<Vaccine> get fetchLocation {
    return [...locations];
  }

  List<int> latLong(int index) {
    return [locations[index].lat, locations[index].long];
  }
}
