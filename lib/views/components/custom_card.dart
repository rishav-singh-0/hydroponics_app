import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearGaugeCard extends StatelessWidget {
  const LinearGaugeCard({
    Key? key,
    required this.label,
    required this.cardIcon,
    required this.currentValue,
    required this.child,
  }) : super(key: key);

  final String label;
  final IconData cardIcon;
  final String currentValue;
  final Widget child;

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
                  Icon(cardIcon),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Text(label,
                      style: TextStyle(
                          fontSize: 14.w, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(currentValue,
                  style:
                      TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold)),
            ],
          ),
          child,
        ]),
      ),
    );
  }
}
