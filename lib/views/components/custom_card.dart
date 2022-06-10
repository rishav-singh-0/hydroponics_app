import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BorderRadius circularBorderRadius = BorderRadius.circular(10.0);
var labelTextStyle = TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold);

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({Key? key, required this.cardChild}) : super(key: key);

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: circularBorderRadius,
          color: Colors.blue,
          backgroundBlendMode: BlendMode.colorBurn,
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.black12,
          //     offset: Offset(0.0, 1.0), //(x,y)
          //     blurRadius: 10.0,
          //   ),
          // ],
        ),
        child: cardChild,
      ),
    );
  }
}

class MonitorCard extends StatelessWidget {
  const MonitorCard({
    Key? key,
    required this.cardIcon,
    required this.label,
    required this.currentValue,
    required this.child,
  }) : super(key: key);

  final IconData cardIcon;
  final String label;
  final String currentValue;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      cardChild: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(cardIcon),
                SizedBox(
                  width: 10.w,
                ),
                Text(label, style: labelTextStyle),
              ],
            ),
            Text(currentValue, style: labelTextStyle),
          ],
        ),
        child,
      ]),
    );
  }
}

class ControlCard extends StatelessWidget {
  const ControlCard({
    Key? key,
    required this.cardIcon,
    required this.label,
    required this.currentValue,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final IconData cardIcon;
  final String label;
  final String currentValue;
  final Widget child;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("tapped"),
      // borderRadius: circularBorderRadius,
      child: ElevatedCard(
        cardChild: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(cardIcon),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(label, style: labelTextStyle),
                ],
              ),
              Text(currentValue, style: labelTextStyle),
            ],
          ),
          child,
        ]),
      ),
    );
  }
}
