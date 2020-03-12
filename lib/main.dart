import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/revenue_list.dart';
import 'package:zenoti_assignment/components/stat_list.dart';
import 'constants.dart';

void main() => runApp(App());

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
  // Isn't StatItem just duplicating _Stat component?
  StatItem(term: 'Revenue', detail: '\$117,454', subDetail: '\$108,207'),
  StatItem(term: 'Utilization', detail: '67%', subDetail: '54%'),
  StatItem(term: 'Feedback', detail: '4.7', subDetail: '4.9'),
  StatItem(term: 'Guests', detail: '718', subDetail: '692'),
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: 'Your Business Name'),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBlue,
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
          preferredSize: Size(0.0, 80.0),
          child: Padding(
            padding: EdgeInsets.all(spacer),
            child: StatList(
              items: statListItems,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0,
      ),
      body: RevenueList(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 100,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: themeBlue,
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
    );
  }
}
