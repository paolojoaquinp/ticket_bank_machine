import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/widgets/scrollable_card_stack.dart';
import 'package:ticket_bank_machine/widgets/card_credit_ticket.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket bank machine',
      home: Scaffold(
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
                  backItemsShadowColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  onTapFrontItem: (value) {
                    
                  },
                  children: List.generate(
                    20,
                    (index) {
                      return CardCreditTicket(index: index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsDashboard extends StatelessWidget {
  const DetailsDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            padding: const EdgeInsets.all(12.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BLR → NGP',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1 Adult',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payable Amount',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '\$283',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentOption('UPI'),
                _buildPaymentOption('Card', isActive: true),
                _buildPaymentOption('Net Banking'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, {bool isActive = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            color: !isActive ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Color y opacidad de la sombra
                      spreadRadius: 1, // Expansión de la sombra
                      blurRadius: 6, // Desenfoque
                      offset: Offset(0, 3), // Desplazamiento (x, y)
                    ),
                  ]
                : null),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.blue : Colors.grey),
          ),
        ),
      ),
    );
  }
}
