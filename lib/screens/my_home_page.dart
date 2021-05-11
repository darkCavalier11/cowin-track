import 'package:cowin/provider/current_state.dart';
import 'package:cowin/provider/vaccine.dart';
import 'package:cowin/widgets/date_scroll.dart';
import 'package:cowin/widgets/vaccine_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pinFieldController = TextEditingController();

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
          Column(
            children: [
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
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  controller: _pinFieldController,
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
              SearchButton(pinFieldController: _pinFieldController)
            ],
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

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
    @required TextEditingController pinFieldController,
  })  : _pinFieldController = pinFieldController,
        super(key: key);

  final TextEditingController _pinFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: FlatButton(
        onPressed: () async {
          final String pincode = _pinFieldController.text.trim();
          if (double.tryParse(pincode) == null) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
                content: Text(
                  'Invalid Pincode',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                ),
              ),
            );
            return;
          }
          FocusScope.of(context).unfocus();
          Provider.of<CurrentStateProvider>(context, listen: false).setPincode(
            int.parse(_pinFieldController.text),
          );
          Provider.of<CurrentStateProvider>(context, listen: false)
              .toggleLoading();
          final dateTime = DateTime.now();
          int day = dateTime.day;
          int month = dateTime.month;
          int year = dateTime.year;
          final String url =
              'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=${_pinFieldController.text}&date=$day-$month-$year';

          final res = await read(url);

          Provider.of<VaccineProvider>(context, listen: false)
              .setLocation(res, dateTime);
          Provider.of<CurrentStateProvider>(context, listen: false)
              .toggleLoading();
        },
        child: Text(
          'Search',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
