import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class VerticalGauge extends StatelessWidget {
  const VerticalGauge(
      {Key? key,
      required this.minRange,
      required this.maxRange,
      required this.pointerValue,
      required this.stringUnit,
      required this.colorLow,
      required this.colorMid,
      required this.colorHigh})
      : super(key: key);

  final double minRange;
  final double maxRange;
  final double pointerValue;
  final String stringUnit;
  final Color colorLow;
  final Color colorMid;
  final Color colorHigh;

  // final List<Color> c = [colorLow, colorMid, colorHigh];

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width >= 1000 ? 550 : 440,
          child: _buildHeatMeter(context),
        ));
  }

  /// Returns the heat meter.
  Widget _buildHeatMeter(BuildContext context) {
    return SfLinearGauge(
        minimum: minRange,
        maximum: maxRange,
        interval: 20.0,
        minorTicksPerInterval: 0,
        animateAxis: true,
        orientation: LinearGaugeOrientation.horizontal,
        labelFormatterCallback: (String value) {
          return value + stringUnit;
        },
        axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
        barPointers: <LinearBarPointer>[
          LinearBarPointer(
              value: maxRange,
              thickness: 24,
              edgeStyle: LinearEdgeStyle.endCurve,
              shaderCallback: (Rect bounds) {
                return LinearGradient(colors: <Color>[
                  colorLow,
                  colorMid,
                  colorHigh
                ], stops: const <double>[
                  0.1,
                  0.4,
                  0.9,
                ]).createShader(bounds);
              }),
        ],
        markerPointers: <LinearMarkerPointer>[
          LinearWidgetPointer(
              value: pointerValue,
              offset: 26,
              position: LinearElementPosition.outside,
              child: SizedBox(
                  width: 55,
                  height: 45,
                  child: Center(
                      child: Text(
                    pointerValue.toStringAsFixed(0) + stringUnit,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: pointerValue < (maxRange * 0.25)
                            ? colorLow
                            : pointerValue < (maxRange * 0.75)
                                ? colorMid
                                : colorHigh),
                  )))),
          LinearShapePointer(
            offset: 25,
            elevation: 5,
            animationType: LinearAnimationType.linear,
            value: pointerValue,
            color: pointerValue < (maxRange * 0.25)
                ? colorLow
                : pointerValue < (maxRange * 0.75)
                    ? colorMid
                    : colorHigh,
          ),
        ]);
  }
}
