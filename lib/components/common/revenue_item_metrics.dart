import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/common/metrics_data_summary.dart';
import 'package:zenoti_assignment/components/common/metrics_chart.dart';
import 'package:zenoti_assignment/constants.dart';
import 'package:zenoti_assignment/models/revenue.dart';

var random = Random();
List<FlSpot> spots;
List<FlSpot> spots2;

class RevenueItemMetrics extends StatelessWidget {
  final Revenue revenue;
  const RevenueItemMetrics({Key key, this.revenue}) : super(key: key);

  // Yes, this is bad. Given more time I would pass this data down from
  // a source as a prop.
  void _generateSpots() {
    spots = [
      FlSpot(1, random.nextDouble() * 5),
      FlSpot(2, random.nextDouble() * 5),
      FlSpot(3, random.nextDouble() * 5),
      FlSpot(4, random.nextDouble() * 5),
      FlSpot(5, random.nextDouble() * 5),
      FlSpot(6, random.nextDouble() * 5),
    ];

    spots2 = [
      FlSpot(1, random.nextDouble() * 5),
      FlSpot(2, random.nextDouble() * 5),
      FlSpot(3, random.nextDouble() * 5),
      FlSpot(4, random.nextDouble() * 5),
      FlSpot(5, random.nextDouble() * 5),
      FlSpot(6, random.nextDouble() * 5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _generateSpots();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(spacer * 2, 0, spacer * 2, spacer),
          child: MetricsDataSummary(
            startAt: revenue.startAt,
            endAt: revenue.endAt,
            amount: revenue.amount,
            previousAmount: revenue.previousAmount,
          ),
        ),
        SizedBox(
          height: 200,
          child: OverflowBox(
            // Cut off first and last data points to
            // give the "draw past the screen" effect
            // TODO: Extrapolate new first and last points
            alignment: Alignment.center,
            maxWidth: double.infinity,
            child: SizedBox(
                width: 550,
                child: MetricsChart(
                  focusedSpots: spots,
                  blurredSpots: spots2,
                )),
          ),
        ),
      ],
    );
  }
}
