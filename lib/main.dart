import 'package:cowin/widgets/date_scroll.dart';
import 'package:cowin/screens/vaccine_status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cowin tracker',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        fontFamily: 'JosefinSans',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  child: Text(
                    'Get Your jab Today!',
                    style: TextStyle(
                      fontFamily: 'JosefinSans',
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ],
              color: Colors.white,
            ),
            margin: EdgeInsets.all(15),
            child: TextField(
              cursorColor: Colors.greenAccent,
              decoration: InputDecoration(
                hintText: 'Enter PIN code',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 10),
            child: DateScroll(),
          ),
          Expanded(
            child: VaccineStatus(),
          ),
        ],
      ),
    );
  }
}
