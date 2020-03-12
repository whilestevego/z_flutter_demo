import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final BoxBorder border;

  const Pill({
    Key key,
    @required this.text,
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
    this.border = const Border(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
