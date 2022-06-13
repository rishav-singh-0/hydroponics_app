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
      body: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
        ),
        child: Obx(
          () {
            var actuators = actuatorController.actuatorList.value;
            if (actuators.isBlank == null) {
              return const Text("Loading");
            }
            return Column(children: [
              Text("Dashboard",
                  style:
                      TextStyle(fontSize: 34.w, fontWeight: FontWeight.bold)),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ControlCard(
                      label: "Main Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: checkOnOff(actuators.motorMain),
                      onTap: () {
                        actuators.motorMain = !actuators.motorMain;
                        actuatorController.updateActuator();
                      },
                    ),
                  ),
                  Expanded(
                    child: ControlCard(
                      label: "Exhaust Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: checkOnOff(actuators.motorExhaust),
                      onTap: () {
                        actuators.motorExhaust = !actuators.motorExhaust;
                        actuatorController.updateActuator();
                      },
                    ),
                  )
                ],
              )),
              Expanded(
                child: ControlCard(
                  label: "Light",
                  cardIcon: FontAwesomeIcons.lightbulb,
                  currentValue: checkOnOff(actuators.light),
                  // child: Text("Some else"),
                  onTap: () {
                    if (actuators.light == 0) {
                      actuators.light = 255;
                    } else {
                      actuators.light = 0;
                    }
                    return actuatorController.updateActuator();
                  },
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ControlCard(
                      label: "Acid Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: checkOnOff(actuators.motorAcid),
                      onTap: () {
                        if (actuators.motorAcid == 0) {
                          actuators.motorAcid = 5; //TODO: use PID here
                        } else {
                          actuators.motorAcid = 0;
                        }
                        actuatorController.updateActuator();
                      },
                    ),
                  ),
                  Expanded(
                    child: ControlCard(
                      label: "Base Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: checkOnOff(actuators.motorBase),
                      onTap: () {
                        if (actuators.motorBase == 0) {
                          actuators.motorBase = 5; //TODO: use PID here
                        } else {
                          actuators.motorBase = 0;
                        }
                        actuatorController.updateActuator();
                      },
                    ),
                  )
                ],
              )),
            ]);
          },
        ),
      ),
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
