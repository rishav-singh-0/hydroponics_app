import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics_app/views/components/gauge.dart';

class LinearGaugeCard extends StatelessWidget {
  const LinearGaugeCard(
      {Key? key,
      required this.label,
      Icon? icon,
      required this.minRange,
      required this.maxRange,
      required this.pointerValue,
      required this.stepSize,
      required this.stringUnit,
      required this.colorLow,
      required this.colorMid,
      required this.colorHigh})
      : super(key: key);

  final String label;
  final double minRange;
  final double maxRange;
  final double pointerValue;
  final double stepSize;
  final String stringUnit;
  final Color colorLow;
  final Color colorMid;
  final Color colorHigh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          backgroundBlendMode: BlendMode.colorBurn,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.thermometer),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Text(label,
                      style: TextStyle(
                          fontSize: 14.w, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(label,
                  style:
                      TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold)),
            ],
          ),
          VerticalGauge(
              minRange: minRange,
              maxRange: maxRange,
              pointerValue: pointerValue,
              stepSize: stepSize,
              stringUnit: stringUnit,
              colorLow: colorLow,
              colorMid: colorMid,
              colorHigh: colorHigh)
        ]),
      ),
    );
  }
}
