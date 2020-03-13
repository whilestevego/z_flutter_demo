import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/metrics_data_summary.dart';
import 'package:zenoti_assignment/components/metrics_chart.dart';
import 'package:zenoti_assignment/constants.dart';

final spots = const [
  FlSpot(1, 1),
  FlSpot(2, 0.5),
  FlSpot(3, 1.44),
  FlSpot(4, 1.4),
  FlSpot(5, 0.6),
  FlSpot(6, 0.3),
];

final spots2 = const [
  FlSpot(1, 0.2),
  FlSpot(2, 0.8),
  FlSpot(3, 2.3),
  FlSpot(4, 1.0),
  FlSpot(5, 0.6),
  FlSpot(6, 1.0),
];

class RevenueItemMetrics extends StatelessWidget {
  const RevenueItemMetrics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(spacer * 2, 0, spacer * 2, spacer),
          child: MetricsDataSummary(),
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
