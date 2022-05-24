import 'package:coin_picker/screens/coin_picker.dart';
import 'package:coin_picker/screens/ticket.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/coin': (context) => CoinPicker(),
        '/ticket': (context) => Ticket(),
      },
      initialRoute: '/coin',
    );
  }
}

