import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/widgets/ticket_card.dart';

class ConfirmationTicketScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: TicketCard()
        ),
     ),
   );
  }
}