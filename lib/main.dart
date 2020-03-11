import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page Stuff Thing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0,
      ),
      body: Container(
        // color: Colors.blueAccent,
        child: ListView(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Product Revenue'),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Text(
                                '+\$453k',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )),
                  Expanded(flex: 1, child: Text('\$6,571,367')),
                  Text('...'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: menuItems
            .map(
              (item) => BottomNavigationBarItem(
                  icon: Icon(
                    item['icon'],
                    color: Colors.grey,
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(color: Colors.grey),
                  )),
            )
            .toList(),
      ),
    );
  }
}
