import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/pill.dart';

class RevenueListFilterBar extends StatelessWidget {
  const RevenueListFilterBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: _TransparentPill(text: '4w'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Container(
              height: 5.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerRight,
            child: _TransparentPill(text: 'AUG \'20'),
          ),
        )
      ],
    );
  }
}

class _TransparentPill extends StatelessWidget {
  final String text;

  const _TransparentPill({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pill(
      text: text,
      backgroundColor: Colors.transparent,
      border: Border.all(
        color: Colors.white,
        width: 1,
        style: BorderStyle.solid,
      ),
    );
  }
}
