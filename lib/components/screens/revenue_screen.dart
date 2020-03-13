import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/common/drawer_menu.dart';
import 'package:zenoti_assignment/components/common/revenue_list.dart';
import 'package:zenoti_assignment/components/common/stat_list.dart';
import 'package:zenoti_assignment/constants.dart';
import 'package:zenoti_assignment/models/revenue.dart';

const menuItems = <Map<String, dynamic>>[
  {
    'icon': Icons.dashboard,
    'title': 'Dashboard',
  },
  {
    'icon': Icons.people,
    'title': 'Employees',
  },
  {
    'icon': Icons.place,
    'title': 'Centers',
  },
  {
    'icon': Icons.chat,
    'title': 'Collaborate',
  },
  {
    'icon': Icons.menu,
    'title': 'Menu',
  },
];

const statListItems = <StatItem>[
  StatItem(term: 'Revenue', detail: '\$117,454', subDetail: '\$108,207'),
  StatItem(term: 'Utilization', detail: '67%', subDetail: '54%'),
  StatItem(term: 'Feedback', detail: '4.7', subDetail: '4.9'),
  StatItem(term: 'Guests', detail: '718', subDetail: '692'),
];

class RevenueScreen extends StatefulWidget {
  final String title;

  RevenueScreen({Key key, this.title}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<RevenueScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Revenue selectedRev;
  DateTime activeDate;

  @override
  void initState() {
    super.initState();

    activeDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Slight light to dark blue gradient in app bar area
        Container(
          height: 650.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(53, 177, 223, 1),
                  Color.fromRGBO(0, 124, 192, 1)
                ]),
          ),
        ),
        Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          drawer: DrawerMenu(),
          appBar: AppBar(
            title: Column(
              children: <Widget>[
                Text(widget.title, style: TextStyle(fontSize: 16.0)),
                Text(
                  'Updated 1hr ago',
                  style: TextStyle(color: Colors.white38, fontSize: 12.0),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size(0.0, 90.0),
              child: Padding(
                padding: EdgeInsets.all(spacer),
                child: StatList(
                  items: statListItems,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: RevenueList(
            activeDate: activeDate,
            selectedRev: selectedRev,
            onCloseTap: () {
              setState(() {
                selectedRev = null;
              });
            },
            onItemTap: (i) {
              setState(() {
                selectedRev = i;
              });
            },
            onSelectDate: (date) {
              setState(() {
                activeDate = date;
              });
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 100,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: themeBlue,
            onTap: (index) {
              log('Index: $index');
              if (_scaffoldKey.currentState.isDrawerOpen) {
                _scaffoldKey.currentState.openEndDrawer();
              } else {
                _scaffoldKey.currentState.openDrawer();
              }
            },
            items: menuItems
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(
                      item['icon'],
                    ),
                    title: Text(
                      item['title'],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
