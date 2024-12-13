import 'package:flutter/material.dart';

class PaymentTerminalScreen extends StatelessWidget {
  const PaymentTerminalScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: 0,
            bottom: 0,
            child: SafeArea(
              top: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: const Offset(2, 0.0),
                    child: Image.asset(
                      'assets/bank-atm-1.png',
                      alignment: Alignment.center,
                      scale: 2,
                    ),
                  ),
                  Image.asset(
                    'assets/bank-atm-2.png',
                    scale: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -(MediaQuery.sizeOf(context).height * 0.2),
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/credit-card-0.png',
              scale: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
