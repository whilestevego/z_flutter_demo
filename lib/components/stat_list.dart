import 'package:flutter/material.dart';
import '../constants.dart';

class StatItem {
  final String term;
  final String detail;
  final subDetail;

  const StatItem({@required this.term, @required this.detail, this.subDetail});
}

class StatList extends StatelessWidget {
  final List<StatItem> items;

  const StatList({
    Key key,
    this.items = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacer),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        children: items
            .map((sI) => _Stat(
                  term: sI.term,
                  detail: sI.detail,
                  subDetail: sI.subDetail,
                ))
            .toList(),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String term;
  final String detail;
  final String subDetail;

  const _Stat({
    @required this.term,
    @required this.detail,
    this.subDetail = '',
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            term.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Divider(height: spacer, color: Color.fromRGBO(255, 255, 255, 0)),
          Text(
            detail,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Divider(height: spacer, color: Color.fromRGBO(255, 255, 255, 0)),
          Text(
            subDetail,
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
