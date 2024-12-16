import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/entities/ticket_bus.dart';
import 'package:ticket_bank_machine/widgets/ticket_card.dart';

class ConfirmationTicketScreen extends StatelessWidget {
  const ConfirmationTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background-confirmation-ticket.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: Hero(
                tag: 'ticket-bus',
                child: TicketCard(
                  ticket: BusTicket.fakeValue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
