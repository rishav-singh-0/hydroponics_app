import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics_app/views/components/gauge.dart';

import 'components/custom_card.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
          ),
        ),
        Text("Monitor",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 34.w, fontWeight: FontWeight.bold)),
        ElevatedCard(
          label: "Temperature",
          currentValue: "60 °c",
          cardIcon: CupertinoIcons.thermometer,
          child: VerticalGauge(
            minRange: 0,
            maxRange: 80,
            stepSize: 20,
            stringUnit: "°c",
            colorLow: Colors.green,
            colorMid: Colors.orange,
            colorHigh: Colors.red,
            pointerValue: 60,
          ),
        ),
        ElevatedCard(
          label: "Humidity",
          currentValue: "90 units",
          cardIcon: CupertinoIcons.drop,
          child: VerticalGauge(
            minRange: 0,
            maxRange: 90,
            stepSize: 20,
            pointerValue: 50,
            stringUnit: "C",
            colorLow: Colors.lightBlue,
            colorMid: Colors.blue,
            colorHigh: Colors.purple,
          ),
        ),
        ElevatedCard(
          label: "Moisture",
          currentValue: "100",
          cardIcon: CupertinoIcons.drop,
          child: VerticalGauge(
              minRange: 0,
              maxRange: 4000,
              pointerValue: 60,
              stepSize: 800,
              stringUnit: "",
              colorLow: Colors.lightBlue,
              colorMid: Colors.blue,
              colorHigh: Colors.purple),
        ),
        ElevatedCard(
          label: "pH",
          currentValue: "100",
          cardIcon: CupertinoIcons.lab_flask,
          child: VerticalGauge(
              minRange: 0,
              maxRange: 14,
              pointerValue: 7.5,
              stepSize: 1,
              stringUnit: "",
              colorLow: Colors.blue,
              colorMid: Colors.orange,
              colorHigh: Colors.red),
        ),
        ElevatedCard(
          label: "Luminosity",
          currentValue: "100",
          cardIcon: CupertinoIcons.light_max,
          child: VerticalGauge(
              minRange: 0,
              maxRange: 4000,
              pointerValue: 1000,
              stepSize: 800,
              stringUnit: "",
              colorLow: Colors.blue,
              colorMid: Colors.orange,
              colorHigh: Colors.red),
        ),
      ]),
    );
  }
}
