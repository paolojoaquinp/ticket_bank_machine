import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/entities/ticket_bus.dart';
import 'package:ticket_bank_machine/screens/confirmation_ticket_screen.dart';
import 'package:ticket_bank_machine/widgets/ticket_card.dart';


class PrintTicketState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 12,
                child: SizedBox(),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: const Offset(-2, 0.0),
                    child: Image.asset(
                      'assets/atm-ticket-2.png',
                      scale: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.4,
          right: 100.0,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1200),
              onEnd: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 1500),
                    pageBuilder: (context, animation, secondaryAnimation) => const ConfirmationTicketScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              builder: (context, animation, child) {
                return Transform.translate(
                  offset: Offset(0.0, lerpDouble(0, 95, animation)!),
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: MediaQuery.sizeOf(context).width * 0.14,
                    child: Hero(
                      tag: 'ticket-bus',
                      flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                         Widget current;
                        if (flightDirection == HeroFlightDirection.push) {
                          current = toHeroContext.widget;
                        } else {
                          current = fromHeroContext.widget;
                        }
                        return Material(
                          color: Colors.transparent,
                          child: AnimatedBuilder(
                            animation: animation,
                            builder: (context, _) {
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..scale(lerpDouble(0.2, 1.0, animation.value)),
                                child: current,
                              );
                            },
                          ),
                        );
                      },
                      child: TicketCard(
                        ticket: BusTicket.fakeValue,
                      ),
                    ),
                  ),
                );
              }),
        ),
        Positioned.fill(
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 12,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/atm-ticket-1.png',
                            scale: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: (constraints.maxHeight * 0.28),
                        left: 0,
                        right: 0,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Printing Your Ticket"),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              const Expanded(
                flex: 10,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}