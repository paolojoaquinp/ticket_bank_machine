import 'dart:ui';
import 'package:flutter/material.dart';

enum ScreenState {
  initial,
  insertCard,
  processing
}

class PaymentTerminalScreen extends StatefulWidget {
  const PaymentTerminalScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<PaymentTerminalScreen> createState() => _PaymentTerminalScreenState();
}

class _PaymentTerminalScreenState extends State<PaymentTerminalScreen> {
  // Current screen state
  ScreenState _currentState = ScreenState.initial;

  @override
  void initState() {
    super.initState();
    // Simulate initial loading and transition
    _initializeScreen();
  }

  void _initializeScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
    });
    setState(() {
      _currentState = ScreenState.insertCard;
    });
  }

  void _introduceCreditCard() {
    setState(() {
      _currentState = ScreenState.processing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_currentState) {
      case ScreenState.initial:
        return _buildInitialState();
      case ScreenState.insertCard:
        return _buildInsertCardState();
      case ScreenState.processing:
        return _buildProcessingState();
    }
  }

  Widget _buildInitialState() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 1200),
            builder: (context, animation, child) {
              return Transform.scale(
                alignment: Alignment.topCenter,
                scale: lerpDouble(0.3, 1, animation)!,
                child: Opacity(
                  opacity: lerpDouble(0.0, 0.9, animation)!,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
              );
            }
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
    );
  }

  Widget _buildInsertCardState() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
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
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 2000),
          // onEnd: _introduceCreditCard,
          builder: (context, animation, child) {
            return Positioned(
              bottom: -(MediaQuery.sizeOf(context).height * 0.2),
              left: 0,
              right: 0,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..scale(lerpDouble(1.0, 0.3, animation))
                  ..translate(
                    lerpDouble(0.0, 340.0, animation),
                    lerpDouble(0.0, -20.0, animation)!,
                  ),
                child: Image.asset(
                  'assets/credit-card-0.png',
                  scale: 1.5,
                ),
              ),
            );
          },
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
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProcessingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}