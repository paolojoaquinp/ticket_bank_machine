import 'dart:math';

import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Hero(
            tag: 'text-app-bar',
            child: Material(
              child: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        'Payable Amount ',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: SizedBox(width: 8),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        '\$283',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              _CreditCardDetail(
                index: index,
                height: MediaQuery.sizeOf(context).height * 0.3,
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: _numericKeyPad(),
              ),
            ],
          ),
        ));
  }

  Widget _numericKeyPad() {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        itemCount: 11,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 40.0,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return SizedBox.shrink();
          } else if (index == 10) {
            return InkWell(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          } else {
            // Botones del 1 al 9
            return InkWell(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _CreditCardDetail extends StatelessWidget {
  const _CreditCardDetail({
    super.key,
    required this.index,
    required this.height,
  });

  final int index;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: double.maxFinite,
        height: height,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: -60,
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  // Detecta si el usuario arrastró hacia abajo
                  if (details.primaryVelocity != null &&
                      details.primaryVelocity! > 0) {
                    Navigator.of(context).pop(); // Cierra la pantalla
                  }
                },
                child: Hero(
                  tag: 'credit-card-$index',
                  child: Transform.rotate(
                    angle: (pi / 180) * 90,
                    child: Image.asset(
                      "assets/credit-card-${index % 4}.png",
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Enter a CVV Number'),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                            color: Colors.grey[200],
                          ),
                          width: 120,
                          height: 32,
                        )
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
}
