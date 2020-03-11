import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;

  const Pill({
    Key key,
    @required this.text,
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: Text(
          text,
          style: TextStyle(color: color),
        ));
  }
}
