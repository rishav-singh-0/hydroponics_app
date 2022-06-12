import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hydroponics_app/views/components/custom_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
          ),
          child: Column(
            children: [
              Text("Dashboard",
                  style:
                      TextStyle(fontSize: 34.w, fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  ControlCard(
                      label: "Main Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: "ON",
                      child: Text("Some else")),
                  ControlCard(
                      label: "Exhast Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: "ON",
                      child: Text("Some else"))
                ],
              ),
              const ControlCard(
                  label: "Light",
                  cardIcon: FontAwesomeIcons.lightbulb,
                  currentValue: "ON",
                  child: Text("Some else")),
              Row(
                children: const [
                  ControlCard(
                      label: "Acid Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: "ON",
                      child: Text("Some else")),
                  ControlCard(
                      label: "Base Motor",
                      cardIcon: FontAwesomeIcons.fan,
                      currentValue: "ON",
                      child: Text("Some else")),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
