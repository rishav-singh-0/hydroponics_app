import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics_app/views/components/constants.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({Key? key, this.cardChild}) : super(key: key);

  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: circularBorderRadius,
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
      child: cardChild,
    );
  }
}

class MonitorCard extends StatelessWidget {
  const MonitorCard({
    Key? key,
    required this.cardIcon,
    required this.label,
    required this.currentValue,
    this.child,
  }) : super(key: key);

  final IconData cardIcon;
  final String label;
  final String currentValue;
  final Widget? child;

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
        Container(child: child)
      ]),
    );
  }
}

class ActuatorButtonCard extends StatelessWidget {
  const ActuatorButtonCard({
    Key? key,
    required this.cardIcon,
    required this.label,
    required this.currentValue,
    this.child,
    required this.onTap,
  }) : super(key: key);

  final IconData cardIcon;
  final String label;
  final String currentValue;
  final Widget? child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: circularBorderRadius,
      child: ElevatedCard(
        cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: labelTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cardIcon,
                    size: 80.h,
                  ),
                ],
              ),
              Text(currentValue, style: labelTextStyle),
            ]),
      ),
    );
  }
}
