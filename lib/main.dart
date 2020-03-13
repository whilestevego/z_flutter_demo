import 'package:flutter/material.dart';
import 'package:zenoti_assignment/components/screens/revenue_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zenoti Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RevenueScreen(title: 'Your Business Name'),
    );
  }
}
