import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/entities/ticket_bus.dart';

class TicketBusDetails extends StatelessWidget {
  const TicketBusDetails({
    super.key,
    required this.ticket,
  });

  final BusTicket ticket;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double baseFontSize = constraints.maxWidth * 0.05;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          constraints: constraints,
          margin: EdgeInsets.all(constraints.maxWidth * 0.1),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
            // gradient: LinearGradient(
            //   colors: [Colors.blue.shade50, Colors.purple.shade50],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(constraints.maxWidth * 0.05)),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8),
                        ),
                      ],
                    ),
                    Icon(Icons.bus_alert, color: Colors.blueAccent, size: baseFontSize * 1.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                          style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.0,),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Passenger', style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8)),
                            Text('Seat', style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket.passengerName,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: baseFontSize),
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
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Terminal', style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8)),
                            Text('Gate', style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8)),
                            Text('Bus Number', style: TextStyle(color: Colors.grey, fontSize: baseFontSize * 0.8)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket.terminal,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: baseFontSize),
                            ),
                            Text(
                              ticket.gate,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: baseFontSize),
                            ),
                            Text(
                              ticket.busNumber,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: baseFontSize),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
