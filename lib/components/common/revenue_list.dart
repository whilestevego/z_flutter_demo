import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/common/revenue_item.dart';
import 'package:zenoti_assignment/components/common/revenue_item_metrics.dart';
import 'package:zenoti_assignment/components/common/revenue_list_filter_bar.dart';
import 'package:zenoti_assignment/constants.dart';

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
          padding: EdgeInsets.fromLTRB(spacer, 0, spacer, spacer),
          child: RevenueListFilterBar(),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // The split transparent and light grey background behind the ListView
              Column(
                children: <Widget>[
                  SizedBox(height: 40.0),
                  Expanded(child: Container(color: themeGrey))
                ],
              ),
              ListView.builder(
                padding: const EdgeInsets.only(left: spacer, right: spacer),
                // Randomly generate up to 100 items
                itemCount: 100,
                itemBuilder: (ctx, i) => RevenueItem(
                  onTap: () {
                    log("Index: $i");
                  },
                  title: [
                    'Product Revenue',
                    'Avg. Ticket Size',
                    'Avg. Invoice Value'
                  ][i % 3],
                  amount: 6571367,
                  previousAmount: 6231367,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
