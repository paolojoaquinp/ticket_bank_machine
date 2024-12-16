import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/screens/home_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ticket bank machine',
      // home: ConfirmationTicketScreen(),
      // home: PaymentTerminalScreen(index: 0,),
      home: HomeScreen(),
    );
  }
}


