import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutTextNormal extends StatelessWidget {
  const AboutTextNormal(this.data);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: 15.w, letterSpacing: 1.2, height: 1.4),
      textAlign: TextAlign.justify,
    );
  }
}
