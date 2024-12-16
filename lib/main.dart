import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/screens/confirmation_ticket_screen.dart';
import 'package:ticket_bank_machine/screens/home_screen.dart';
import 'package:ticket_bank_machine/screens/payment_terminal_screen/payment_terminal_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket bank machine',
      // home: ConfirmationTicketScreen(),
      home: PaymentTerminalScreen(index: 0,),
    );
  }
}


