import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydroponics_app/controllers/bottom_nav_controller.dart';
import 'package:hydroponics_app/views/about_page.dart';
import 'package:hydroponics_app/views/chart_page.dart';
import 'package:hydroponics_app/views/dashboard_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [DashboardPage(), ChartPage(), AboutPage()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar),
              label: 'Chart',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.info),
              label: 'About',
            ),
          ],
        ),
      );
    });
  }
}
