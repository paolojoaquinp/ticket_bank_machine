import 'package:flutter/material.dart';

class PaymentTerminalScreen extends StatelessWidget {
  const PaymentTerminalScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return const _Page();
  }
}

class _Page extends StatelessWidget {
  const _Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(flex: 1,child: SizedBox(),),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/bank-atm-2.png',
                      scale: 2,
                    ),
                  ),
                ),
              ],
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
          Positioned.fill(
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: const Offset(1.8, 0.0),
                      child: Image.asset(
                        'assets/bank-atm-1.png',
                        scale: 2,
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 1,child: SizedBox(),),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
