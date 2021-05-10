import 'package:cowin/provider/vaccine.dart';
import 'package:cowin/screens/gmap.dart';
import 'package:cowin/screens/my_home_page.dart';
import 'package:cowin/widgets/date_scroll.dart';
import 'package:cowin/widgets/vaccine_status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => VaccineProvider(),
      child: MaterialApp(
        title: 'Cowin tracker',
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          fontFamily: 'JosefinSans',
        ),
        home: MyHomePage(),
      ),
    );
  }
}
