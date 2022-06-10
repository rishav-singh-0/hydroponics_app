import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics_app/views/components/gauge_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Padding(
          padding: EdgeInsets.only(
            left: 28.w,
            right: 18.w,
            top: 36.h,
          ),
          child: Column(
            children: [
              Text("Dashboard",
                  style:
                      TextStyle(fontSize: 34.w, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
    );
  }
}
