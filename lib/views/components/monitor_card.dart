import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics_app/views/components/constants.dart';
import 'package:hydroponics_app/views/components/custom_card.dart';

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
