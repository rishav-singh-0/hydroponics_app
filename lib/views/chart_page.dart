import 'package:flutter/material.dart';
import 'package:hydroponics_app/views/components/gauge.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        VerticalGauge(
          minRange: 0,
          maxRange: 80,
          pointerValue: 10,
          stringUnit: '°c',
          colorLow: Colors.green,
          colorMid: Colors.orange,
          colorHigh: Colors.red,
        ),
      ]),
    );
  }
}
