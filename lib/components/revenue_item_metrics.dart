import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
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
    );
  }
}

class MetricsChart extends StatelessWidget {
  final List<FlSpot> focusedSpots;
  final List<FlSpot> blurredSpots;

  const MetricsChart({
    Key key,
    @required this.focusedSpots,
    this.blurredSpots = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        lineBarsData: [
          _createFocusedLine(focusedSpots),
          if (blurredSpots?.isNotEmpty) _createBlurredLine(blurredSpots)
        ],
        minY: 0,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitles: (value) {
              return '$value\nStuff';
            },
            textStyle: const TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

LineChartBarData _createFocusedLine(List<FlSpot> spots) {
  return LineChartBarData(
      spots: spots,
      isCurved: true,
      barWidth: 2,
      colors: [Colors.white],
      belowBarData: BarAreaData(
        show: true,
        colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.0)],
        gradientColorStops: [0.4, 0.9],
        gradientFrom: const Offset(0, 0),
        gradientTo: const Offset(0, 1),
        spotsLine: BarAreaSpotsLine(
          show: true,
          flLineStyle: const FlLine(color: Colors.white30, strokeWidth: 2),
          checkToShowSpotLine: (spot) => !(spot.x == 0 || spot.x == 6),
        ),
      ),
      dotData: FlDotData(show: false));
}

LineChartBarData _createBlurredLine(List<FlSpot> spots) {
  return LineChartBarData(
      spots: spots,
      barWidth: 2,
      colors: [Colors.white30],
      dashArray: [5, 5],
      isCurved: true,
      belowBarData: BarAreaData(
        show: true,
        colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.0)],
        gradientColorStops: [0, 0.7],
        gradientFrom: const Offset(0, 0),
        gradientTo: const Offset(0, 1),
        spotsLine: BarAreaSpotsLine(show: false),
      ),
      dotData: FlDotData(show: false));
}
