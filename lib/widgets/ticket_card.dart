import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/entities/ticket_bus.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.ticket,
  });

  final BusTicket ticket;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double baseFontSize = constraints.maxWidth * 0.05;
      return Container(
        constraints: constraints,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02),
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
              height: constraints.maxHeight * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                color: Colors.white,
              ),
              child: _ticketHead(baseFontSize),
            ),
            Container(
              height: constraints.maxHeight * 0.77,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ticket-bus-background.png',
                  ),
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(constraints.maxWidth * 0.06),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Passenger',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: baseFontSize * 0.8)),
                            Text('Seat',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: baseFontSize * 0.8)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket.passengerName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: baseFontSize),
                            ),
                            Text(
                              ticket.seatNumber,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: baseFontSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02) ,
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05, vertical: constraints.maxHeight * 0.03),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Terminal',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: baseFontSize * 0.8)),
                            Text('Gate',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: baseFontSize * 0.8)),
                            Text('Bus Number',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: baseFontSize * 0.8)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket.terminal,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: baseFontSize),
                            ),
                            Text(
                              ticket.gate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: baseFontSize),
                            ),
                            Text(
                              ticket.busNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: baseFontSize),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Row _ticketHead(double baseFontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${ticket.departureTime.hour}:${ticket.departureTime.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: baseFontSize + 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ticket.departureLocation,
              style:
                  TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8),
            ),
          ],
        ),
        Icon(Icons.bus_alert,
            color: Colors.blueAccent, size: baseFontSize * 1.5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${ticket.arrivalTime.hour}:${ticket.arrivalTime.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: baseFontSize + 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ticket.arrivalLocation,
              style:
                  TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8),
            ),
          ],
        ),
      ],
    );
  }
}
