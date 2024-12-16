import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/entities/ticket_bus.dart';
import 'package:ticket_bank_machine/widgets/ticket_bus_details.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: constraints,
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: constraints.maxHeight * 0.2,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.77,
                    child: Image.asset(
                      'assets/ticket-bus-background.png',
                      scale: 1.0,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Expanded(child: TicketBusDetails(ticket: BusTicket.fakeValue)),
            ),
          ],
        ),
      );
    });
  }
}