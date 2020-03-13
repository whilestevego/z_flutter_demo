import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zenoti_assignment/components/common/pill.dart';
import 'package:zenoti_assignment/constants.dart';
import 'package:zenoti_assignment/formatters.dart';

class RevenueItem extends StatelessWidget {
  final String title;
  final num amount;
  final num previousAmount;
  final DateTime startAt;
  final DateTime endAt;
  final Function() onTap;

  const RevenueItem({
    Key key,
    @required this.title,
    @required this.amount,
    @required this.previousAmount,
    @required this.startAt,
    @required this.endAt,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var delta = amount - previousAmount;

    return Padding(
      padding: const EdgeInsets.only(bottom: spacer),
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        color: Colors.white,
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(spacer),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title),
                        SizedBox(height: spacer),
                        Row(
                          children: <Widget>[
                            Pill(
                              text: NumberFormat.compact()
                                  .format(delta)
                                  .toString(),
                              backgroundColor:
                                  delta > 0 ? Colors.green : Colors.redAccent,
                            ),
                            SizedBox(width: spacer),
                            Text(
                              'From ${fMonthDay.format(startAt)} - ${fMonthDay.format(endAt)}',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 10.0,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(fCurrency.format(amount)),
                        SizedBox(height: spacer),
                        Text(fCurrency.format(previousAmount),
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 13,
                            )),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: spacer),
                  child: Text(
                    '...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
