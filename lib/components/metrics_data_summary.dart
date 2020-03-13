import 'package:flutter/material.dart';

class MetricsDataSummary extends StatelessWidget {
  const MetricsDataSummary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: <Widget>[
          _DateAndValue(),
          Divider(
            color: Colors.white38,
            thickness: 1,
          ),
          _DateAndValue(color: Colors.white38),
        ],
      ),
    );
  }
}

class _DateAndValue extends StatelessWidget {
  final Color color;

  const _DateAndValue({Key key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Jul 31 - Aug 6',
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        ),
        Text(
          '\$6,571,367',
          style: TextStyle(
            fontSize: 28,
            color: color,
          ),
        ),
      ],
    );
  }
}
