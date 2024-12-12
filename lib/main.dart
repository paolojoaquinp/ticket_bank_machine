import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/home_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket bank machine',
      home: HomeScreen(),
    );
  }
}


