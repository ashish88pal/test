import 'package:flutter/material.dart';

import 'clock_dial_painter.dart';
import 'clock_hands.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  const ClockFace({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey.shade50,
                  Colors.grey.shade100,
                  Colors.grey.shade200,
                  Colors.grey.shade300,
                  Colors.grey.shade400,
                  Colors.grey.shade500,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.9]),
          ),
          child: Stack(
            children: <Widget>[
              //dial and numbers
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: CustomPaint(
                  painter: ClockDialPainter(dateTime),
                ),
              ),

              // Center(
              //     child: Padding(
              //   padding: const EdgeInsets.only(top: 200),
              //   child:
              //       Text("${dateTime.day}-${dateTime.month}-${dateTime.year}"),
              // )),
              // Container(
              //   width: double.infinity,
              //   height: double.infinity,
              //   padding: const EdgeInsets.all(10.0),
              //   child: CustomPaint(
              //     painter: ClockDatePainter(),
              //   ),
              // ),

              //centerpoint
              Center(
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),

              ClockHands(
                dateTime: dateTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
