import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics_app/views/components/constants.dart';
import 'package:hydroponics_app/views/components/custom_card.dart';

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
