import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/screens/checkout_screen.dart';
import 'package:ticket_bank_machine/widgets/card_credit_ticket.dart';
import 'package:ticket_bank_machine/widgets/details_dashboard.dart';
import 'package:ticket_bank_machine/widgets/scrollable_card_stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Payments',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: false,
        leading: GestureDetector(
          child: Image(
            image: AssetImage('assets/back-icon.png'),
          ),
        ),
      ),
      body: Expanded(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: DetailsDashboard(),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: PerspectiveListView(
                visualizedItems: 4,
                itemExtent: MediaQuery.sizeOf(context).height * .48,
                initialIndex: 7,
                backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                onTapFrontItem: (currentIndex) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 1000),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CheckoutScreen(
                        index: currentIndex ?? 0,
                      ),
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
                children: List.generate(
                  20,
                  (index) {
                    return Hero(
                      tag: 'credit-card-$index',
                      flightShuttleBuilder: (flightContext, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
                        Widget current;
                        if (flightDirection == HeroFlightDirection.push) {
                          current = toHeroContext.widget;
                        } else {
                          current = fromHeroContext.widget;
                        }
                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, _) {
                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..scale(lerpDouble(1.5, 1.0, animation.value))
                                ..rotateZ(lerpDouble((pi/180) * -90, (pi/180) * 0, animation.value)!),
                              child: current,
                            );
                          },
                        );
                      },
                      child: CardCreditTicket(index: index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
