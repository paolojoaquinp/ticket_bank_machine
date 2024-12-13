import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<String> _cvvNumber = List.generate(3, (_) => ' ');
  final List<bool> _slideAnimations = [
    false,
    false,
    false,
  ];

  void _updateCVVNumber(String digit) {
    setState(() {
      if (digit == 'delete') {
        for (int i = _cvvNumber.length - 1; i >= 0; i--) {
          if (_cvvNumber[i] != '•') {
            _cvvNumber[i] = '•';
            _slideAnimations[i] = !_slideAnimations[i];
            break;
          }
        }
      } else {
        for (int i = 0; i < _cvvNumber.length; i++) {
          if (_cvvNumber[i] == ' ') {
            _cvvNumber[i] = digit;
            _slideAnimations[i] = !_slideAnimations[i];
            break;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          forceMaterialTransparency: true,
          centerTitle: true,
          title: RichText(
            text: const TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Hero(
                    tag: 'text-app-bar-1',
                    child: Material(
                      color: Colors.white,
                      child: Text(
                        'Payable Amount ',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 8),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Hero(
                    tag: 'text-app-bar-2',
                    child: Material(
                      color: Colors.white,
                      child: Text(
                        '\$283',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              _CreditCardDetail(
                index: widget.index,
                height: MediaQuery.sizeOf(context).height * 0.32,
                cvvNumber: _cvvNumber,
                slideAnimations: _slideAnimations,
                isComplete: !_cvvNumber.contains(" "),
              ),
              const SizedBox(
                height: 12.0,
              ),
              if (!_cvvNumber.contains(" "))
                TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 1200),
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    builder: (context, animation, _) {
                      return Transform(
                        alignment: Alignment.center,
                        origin: Offset.zero,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..scale(lerpDouble(0.4, 1, animation))
                          ..translate(0.0, lerpDouble(100.0, 0.0, animation)!),
                        child: Opacity(
                          opacity: animation,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 9,
                              backgroundColor: AppColors.electricIndigo,
                              foregroundColor: Colors.white,
                              maximumSize: const Size(double.maxFinite, 46.0),
                              minimumSize: const Size(double.maxFinite, 46.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Complete Payment"),
                          ),
                        ),
                      );
                    })
              else
                const SizedBox(
                  height: 46,
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
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 45.0,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return SizedBox.shrink();
          } else if (index == 10) {
            return InkWell(
              onTap: () => _updateCVVNumber("0"),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: const Text(
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
              onTap: () => _updateCVVNumber("${index + 1}"),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
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
    required this.cvvNumber,
    required this.slideAnimations,
    this.isComplete = false,
  });

  final int index;
  final double height;
  final List<String> cvvNumber;
  final List<bool> slideAnimations;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    // const heightButton = 46.0 + 12.0;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: double.maxFinite,
        clipBehavior: Clip.none,
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
              top: -(MediaQuery.sizeOf(context).height * 0.08),
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  // Detecta si el usuario arrastró hacia abajo
                  if (details.primaryVelocity != null &&
                      details.primaryVelocity! > 0) {
                    Navigator.of(context).pop();
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
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Enter a CVV Number'),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                            color: Colors.grey[200],
                          ),
                          width: 120,
                          height: 32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(cvvNumber.length, (index) {
                              return SlideInDown(
                                from: 25,
                                animate: slideAnimations[index],
                                child: Text(
                                  cvvNumber[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }),
                          ),
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
