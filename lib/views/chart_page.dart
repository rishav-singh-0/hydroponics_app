// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hydroponics_app/controllers/firestore_controller.dart';
import 'package:hydroponics_app/views/components/constants.dart';
import 'package:hydroponics_app/views/components/gauge.dart';
import 'package:hydroponics_app/views/components/monitor_card.dart';

class ChartPage extends StatelessWidget {
  ChartPage({Key? key}) : super(key: key);
  final MonitorController monitorController = Get.put(MonitorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (monitorController.monitorList.value.isEmpty) {
          return Text("Loading");
        }
        return ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: headerPadding,
          ),
          Text("Monitor", textAlign: TextAlign.center, style: headerTextStyle),
          MonitorCard(
            label: "Temperature",
            currentValue: "${monitorController.latestMonitor.temperature} °c",
            cardIcon: FontAwesomeIcons.temperatureHalf,
            child: VerticalGauge(
              minRange: 0,
              maxRange: 80,
              stepSize: 20,
              stringUnit: "°c",
              colorLow: Colors.green,
              colorMid: Colors.orange,
              colorHigh: Colors.red,
              pointerValue:
                  monitorController.latestMonitor.temperature.toDouble(),
            ),
          ),
          MonitorCard(
            label: "Humidity",
            currentValue: "${monitorController.latestMonitor.humidity} units",
            cardIcon: FontAwesomeIcons.droplet,
            child: VerticalGauge(
              minRange: 0,
              maxRange: 90,
              stepSize: 20,
              pointerValue: monitorController.latestMonitor.humidity.toDouble(),
              stringUnit: "C",
              colorLow: Colors.lightBlue,
              colorMid: Colors.blue,
              colorHigh: Colors.purple,
            ),
          ),
          MonitorCard(
            label: "Moisture",
            currentValue: "${monitorController.latestMonitor.moisture}",
            cardIcon: FontAwesomeIcons.droplet,
            child: VerticalGauge(
                minRange: 0,
                maxRange: 4000,
                pointerValue:
                    monitorController.latestMonitor.moisture.toDouble(),
                stepSize: 800,
                stringUnit: "",
                colorLow: Colors.lightBlue,
                colorMid: Colors.blue,
                colorHigh: Colors.purple),
          ),
          MonitorCard(
            label: "pH",
            currentValue: "${monitorController.latestMonitor.pH}",
            cardIcon: FontAwesomeIcons.flask,
            child: VerticalGauge(
                minRange: 0,
                maxRange: 14,
                pointerValue: monitorController.latestMonitor.pH.toDouble(),
                stepSize: 1,
                stringUnit: "",
                colorLow: Colors.blue,
                colorMid: Colors.orange,
                colorHigh: Colors.red),
          ),
          MonitorCard(
            label: "Luminosity",
            currentValue: "${monitorController.latestMonitor.light}",
            cardIcon: FontAwesomeIcons.lightbulb,
            child: VerticalGauge(
                minRange: 0,
                maxRange: 4000,
                pointerValue: monitorController.latestMonitor.light.toDouble(),
                stepSize: 800,
                stringUnit: "",
                colorLow: Colors.blue,
                colorMid: Colors.orange,
                colorHigh: Colors.red),
          ),
        ]);
      }),
    );
  }
}
