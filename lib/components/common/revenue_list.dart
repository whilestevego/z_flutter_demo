import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/common/revenue_item.dart';
import 'package:zenoti_assignment/components/common/revenue_item_metrics.dart';
import 'package:zenoti_assignment/components/common/revenue_list_filter_bar.dart';
import 'package:zenoti_assignment/constants.dart';
import 'package:zenoti_assignment/mock_data.dart';

typedef Revenue RevenueBuilder(int index);

class RevenueList extends StatelessWidget {
  final RevenueBuilder revenueBuilder;

  const RevenueList({
    this.revenueBuilder = generateRevenue,
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
                itemBuilder: (_, i) {
                  var rev = revenueBuilder(i);

                  return RevenueItem(
                    onTap: () {
                      log("Index: $i");
                    },
                    title: rev.title,
                    amount: rev.amount,
                    previousAmount: rev.previousAmount,
                    startAt: rev.startAt,
                    endAt: rev.endAt,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
