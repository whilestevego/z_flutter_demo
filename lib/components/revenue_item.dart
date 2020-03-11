import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zenoti_assignment/components/pill.dart';
import 'package:zenoti_assignment/constants.dart';

class RevenueItem extends StatelessWidget {
  final String title;
  final num amount;
  final num previousAmount;

  const RevenueItem({
    Key key,
    @required this.title,
    @required this.amount,
    @required this.previousAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat("\$###,###", "en_CA");

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(spacer),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2.0),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title),
                    Pill(
                      text: '+\$453k',
                      backgroundColor: Colors.redAccent,
                    )
                  ],
                )),
            Expanded(flex: 1, child: Text(f.format(amount))),
            Text('...'),
          ],
        ),
      ),
    );
  }
}
