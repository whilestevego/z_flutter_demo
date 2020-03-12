import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/revenue_item.dart';
import '../constants.dart';

class RevenueList extends StatelessWidget {
  const RevenueList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeGrey,
      child: ListView.builder(
        padding:
            const EdgeInsets.only(left: spacer, right: spacer, top: spacer),
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
    );
  }
}
