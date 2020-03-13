import 'package:flutter/material.dart';

class Revenue {
  final String title;
  final double amount;
  final double previousAmount;
  final DateTime startAt;
  final DateTime endAt;

  const Revenue({
    @required this.title,
    @required this.amount,
    @required this.previousAmount,
    @required this.startAt,
    @required this.endAt,
  });
}
