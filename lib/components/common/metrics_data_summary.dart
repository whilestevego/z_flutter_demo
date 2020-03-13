import 'package:flutter/material.dart';
import 'package:zenoti_assignment/formatters.dart';

class MetricsDataSummary extends StatelessWidget {
  final double amount;
  final double previousAmount;
  final DateTime startAt;
  final DateTime endAt;

  const MetricsDataSummary({
    Key key,
    @required this.amount,
    @required this.previousAmount,
    @required this.startAt,
    @required this.endAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _DateAndValue(
            value: amount,
            startAt: startAt,
            endAt: endAt,
          ),
          Divider(
            color: Colors.white38,
            thickness: 1,
          ),
          _DateAndValue(
            value: previousAmount,
            startAt: startAt.subtract(Duration(days: 7)),
            endAt: startAt.subtract(Duration(days: 1)),
            color: Colors.white38,
            fontSize: 24,
          ),
        ],
      ),
    );
  }
}

class _DateAndValue extends StatelessWidget {
  final DateTime startAt;
  final DateTime endAt;
  final double value;
  final Color color;
  final double fontSize;

  const _DateAndValue({
    Key key,
    @required this.startAt,
    @required this.endAt,
    @required this.value,
    this.color = Colors.white,
    this.fontSize = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${fMonthDay.format(startAt)} - ${fMonthDay.format(endAt)}',
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        ),
        Text(
          fCurrency.format(value),
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ],
    );
  }
}
