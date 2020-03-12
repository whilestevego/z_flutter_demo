import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/revenue_item.dart';
import 'package:zenoti_assignment/components/revenue_item_metrics.dart';
import 'package:zenoti_assignment/components/revenue_list_filter_bar.dart';
import '../constants.dart';

class RevenueList extends StatelessWidget {
  const RevenueList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RevenueItemMetrics(),
        Padding(
          padding: EdgeInsets.fromLTRB(spacer, 0, spacer, 0),
          child: RevenueListFilterBar(),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Expanded(child: Container(color: themeGrey))
                ],
              ),
              ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.black],
                ).createShader(
                  Rect.fromLTRB(0, 0, bounds.width, spacer * 2),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: spacer,
                    right: spacer,
                    top: spacer * 2,
                  ),
                  // Randomly generate up to 100 items
                  itemCount: 100,
                  itemBuilder: (ctx, i) => RevenueItem(
                    title: [
                      'Product Revenue',
                      'Avg. Ticket Size',
                      'Avg. Invoice Value'
                    ][i % 3],
                    amount: 6571367,
                    previousAmount: 6231367,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
