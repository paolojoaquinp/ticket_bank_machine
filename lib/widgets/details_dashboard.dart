import 'package:flutter/material.dart';

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
                    Hero(
                      tag: 'text-app-bar-1',
                      child: Material(
                        color: Colors.white,
                        child: Text(
                          'Payable Amount',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'text-app-bar-2',
                      child: Material(
                        color: Colors.white,
                        child: Text(
                          '\$283',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
              borderRadius: const BorderRadius.all(
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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      offset: const Offset(0, 3), // Desplazamiento (x, y)
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
