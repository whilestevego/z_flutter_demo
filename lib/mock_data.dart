import 'dart:math';

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

var rando = Random();
List<Revenue> productSalesData = [];

Revenue generateRevenue(int index) {
  if (index > productSalesData.length - 1) {
    var startAt = DateTime.utc(
      2000 + rando.nextInt(18),
      rando.nextInt(11) + 1,
      rando.nextInt(28),
    );

    productSalesData.add(Revenue(
      title: [
        'Product Revenue',
        'Avg. Ticket Size',
        'Avg. Invoice Value'
      ][rando.nextInt(2)],
      amount: 3000000 + (rando.nextDouble() * 5000000),
      previousAmount: 3000000 + (rando.nextDouble() * 5000000),
      startAt: startAt,
      endAt: startAt.add(Duration(days: 7)),
    ));
  }

  return productSalesData[index];
}
