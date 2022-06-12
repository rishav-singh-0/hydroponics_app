import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hydroponics_app/views/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: const Color(0xFF0A0E20),
        //   scaffoldBackgroundColor: const Color(0xFF0A0E20),
        //   textTheme: TextTheme(bodyText1: TextStyle()),
        //   colorScheme:
        //       ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        // ),
        home: HomePage(),
      ),
    );
  }
}
