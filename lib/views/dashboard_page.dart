import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hydroponics_app/controllers/firebase_rtdb_controller.dart';
import 'package:hydroponics_app/views/components/custom_card.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final ActuatorController actuatorController = Get.put(ActuatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
          ),
          child: Obx(
            () {
              if (actuatorController.actuatorList.value == null) {
                return Text("Loading");
              }
              return Column(
                children: [
                  Text("Dashboard",
                      style: TextStyle(
                          fontSize: 34.w, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      ControlCard(
                        label: "Main Motor",
                        cardIcon: FontAwesomeIcons.fan,
                        currentValue: checkOnOff(
                            actuatorController.latestActuator.motorMain),
                      ),
                      ControlCard(
                        label: "Exhaust Motor",
                        cardIcon: FontAwesomeIcons.fan,
                        currentValue: checkOnOff(
                            actuatorController.latestActuator.motorExhaust),
                      )
                    ],
                  ),
                  ControlCard(
                      label: "Light",
                      cardIcon: FontAwesomeIcons.lightbulb,
                      currentValue:
                          checkOnOff(actuatorController.latestActuator.light),
                      child: Text("Some else")),
                  Row(
                    children: [
                      ControlCard(
                        label: "Acid Motor",
                        cardIcon: FontAwesomeIcons.fan,
                        currentValue: checkOnOff(
                            actuatorController.latestActuator.motorAcid),
                      ),
                      ControlCard(
                        label: "Base Motor",
                        cardIcon: FontAwesomeIcons.fan,
                        currentValue: checkOnOff(
                            actuatorController.latestActuator.motorBase),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}

String checkOnOff(var value) {
  if (value.runtimeType == bool && value) {
    return "ON";
  } else if (value.runtimeType == int && value > 0) {
    return "ON";
  }
  return "OFF";
}
