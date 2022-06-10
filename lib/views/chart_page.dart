import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics_app/views/components/gauge.dart';

import 'components/gauge_card.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        LinearGaugeCard(
            label: "Temperature",
            minRange: 0,
            maxRange: 80,
            pointerValue: 60,
            stepSize: 20,
            stringUnit: "°c",
            colorLow: Colors.green,
            colorMid: Colors.orange,
            colorHigh: Colors.red),
        LinearGaugeCard(
            label: "Humidity",
            minRange: 0,
            maxRange: 90,
            pointerValue: 50,
            stepSize: 20,
            stringUnit: "C",
            colorLow: Colors.lightBlue,
            colorMid: Colors.blue,
            colorHigh: Colors.purple),
        LinearGaugeCard(
            label: "Moisture",
            minRange: 0,
            maxRange: 4000,
            pointerValue: 60,
            stepSize: 800,
            stringUnit: "",
            colorLow: Colors.lightBlue,
            colorMid: Colors.blue,
            colorHigh: Colors.purple),
        LinearGaugeCard(
            label: "pH",
            minRange: 0,
            maxRange: 14,
            pointerValue: 7.5,
            stepSize: 1,
            stringUnit: "",
            colorLow: Colors.blue,
            colorMid: Colors.orange,
            colorHigh: Colors.red),
        LinearGaugeCard(
            label: "Luminosity",
            minRange: 0,
            maxRange: 4000,
            pointerValue: 1000,
            stepSize: 800,
            stringUnit: "",
            colorLow: Colors.blue,
            colorMid: Colors.orange,
            colorHigh: Colors.red),
      ]),
    );
  }
}
