import 'package:flutter/material.dart';
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
