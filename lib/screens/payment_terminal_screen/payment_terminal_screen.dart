import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_bank_machine/screens/payment_terminal_screen/bloc/payment_terminal_bloc.dart';

class PaymentTerminalScreen extends StatelessWidget {
  const PaymentTerminalScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentTerminalBloc>(
      lazy: true,
      create: (context) =>
          PaymentTerminalBloc()..add(const PaymentTerminalInitialEvent()),
      child: const _Page(),
    );
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
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentTerminalBloc, PaymentTerminalState>(
      builder: (context, state) {
        if (state is PaymentTerminalInitialState) {
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
                    }),
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
        if (state is PaymentTerminalInsertCardState) {
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
                          // scale: 1.5,
                        ),
                      ),
                    );
                  }),
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
        } else {
          return SizedBox(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
