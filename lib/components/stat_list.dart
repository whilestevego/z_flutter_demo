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
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items
            .map((sI) => [
                  Expanded(
                    child: Container(
                      child: _Stat(
                        term: sI.term,
                        detail: sI.detail,
                        subDetail: sI.subDetail,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.white38,
                    thickness: 1,
                  )
                ])
            .fold([], (acc, v) => acc + v)
              ..removeLast(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          term.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: spacer),
        Text(
          detail,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: spacer),
        Text(
          subDetail,
          style: TextStyle(color: Colors.white54, fontSize: 13),
        ),
      ],
    );
  }
}
