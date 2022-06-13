import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var headerPadding = EdgeInsets.only(
  top: 20.h,
);

var headerTextStyle = TextStyle(fontSize: 34.w, fontWeight: FontWeight.bold);

var circularBorderRadius = BorderRadius.circular(10.0);

var labelTextStyle = TextStyle(fontSize: 15.w, fontWeight: FontWeight.bold);

String checkOnOff(var value) {
  if (value.runtimeType == bool && value) {
    return "ON";
  } else if (value.runtimeType == int && value > 0) {
    return "ON";
  }
  return "OFF";
}
