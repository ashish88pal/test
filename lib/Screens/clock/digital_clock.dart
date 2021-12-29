import 'dart:async';

import 'package:flutter/material.dart';

class DigiClock extends StatefulWidget {
  const DigiClock({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DigiClock();
  }
}

class _DigiClock extends State<DigiClock> {
  late Timer _timer;
  late DateTime dateTime;
  bool _is24Hours = true;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildClockCircle(context);
  }

  Container buildClockCircle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0.0, 5.0),
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${_is24Hours ? dateTime.hour : dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}"
            " : ${dateTime.minute}"
            " : ${dateTime.second} "
            "${_is24Hours ? " 24H" : dateTime.hour > 12 ? "PM" : "AM"}",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.12),
          ),
          Text(
            "${dateTime.day} : ${dateTime.month} : ${dateTime.year}",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.14),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _is24Hours = !_is24Hours;
                  });
                },
                child: Text("Change to ${_is24Hours ? "12-h" : "24-h"}")),
          )
        ],
      ),
    );
  }
}
