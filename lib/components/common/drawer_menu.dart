import 'package:flutter/material.dart';
import 'package:zenoti_assignment/constants.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                )),
            decoration: BoxDecoration(
              color: themeBlue,
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text('Account'),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.settings),
                Text('Settings'),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.track_changes),
                Text('Other'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
