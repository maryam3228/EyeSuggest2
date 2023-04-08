import 'package:flutter/material.dart';

class SnellenChartWidget extends StatefulWidget {
  final int feet;
  final String letterToDisplay;
  const SnellenChartWidget({
    Key? key,
    required this.feet,
    required this.letterToDisplay,
  }) : super(key: key);

  @override
  State<SnellenChartWidget> createState() => _SnellenChartWidgetState();
}

class _SnellenChartWidgetState extends State<SnellenChartWidget> {
  final Map<int, double> fontSize = {
    70: (16 / 12) * 152,
    60: (16 / 12) * 130,
    50: (16 / 12) * 108,
    40: (16 / 12) * 87,
    30: (16 / 12) * 65,
    20: (16 / 12) * 43,
    15: (16 / 12) * 33,
    10: (16 / 12) * 21,
    7: (16 / 12) * 15,
    4: (16 / 12) * 9,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Distance: ' + widget.feet.toString() + ' feet',
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        Text(
          widget.letterToDisplay,
          style: TextStyle(
            fontSize: fontSize[widget.feet],
            fontFamily: 'Courier_Prime',
          ),
        ),
      ],
    );
  }
}
