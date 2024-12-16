import 'dart:async';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ticket_bank_machine/entities/ticket_bus.dart';
import 'package:ticket_bank_machine/widgets/ticket_bus_details.dart';
import 'package:ticket_bank_machine/widgets/ticket_card.dart';

enum ScreenState {
  initial,
  insertCard,
  processing,
  otpValidation,
  printTicket,
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

class _PaymentTerminalScreenState extends State<PaymentTerminalScreen>
    with TickerProviderStateMixin {
  // Current screen state
  ScreenState _currentState = ScreenState.initial;

  // Animation controller
  late AnimationController _cardAnimationController;
  late Animation<double> _cardAnimation;

  late AnimationController _otpAnimationController;
  late Animation<double> _otpAnimation;

  @override
  void initState() {
    super.initState();
    // Simulate initial loading and transition
    _initializeScreen();
    // Initialize animation controller
    _cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    // Create animation
    _cardAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _otpAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _otpAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _otpAnimationController,
        curve: Curves.ease,
      ),
    );
  }

  void _initializeScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    setState(() {
      _currentState = ScreenState.insertCard;
    });
  }

  void _introduceCreditCard() {
    setState(() {
      _currentState = ScreenState.processing;
    });
  }

  Future<void>? _otpValidation(void value) {
    _currentState = ScreenState.otpValidation;
    setState(() {});
  }

  Future<void>? _printTicket(void value) {
    _currentState = ScreenState.printTicket;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cardAnimationController.dispose();
    _otpAnimationController.dispose();
    super.dispose();
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
      case ScreenState.otpValidation:
        return _buildOTPState();
      case ScreenState.printTicket:
        return _buildPrintTicketState();
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
                        const Expanded(
                          flex: 1,
                          child: _AtmTerminal(
                            leading: Text(
                              'Insert Card',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
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
        AnimatedBuilder(
            animation: _cardAnimation,
            builder: (context, child) {
              return TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 2000),
                onEnd: () {
                  _cardAnimationController.forward().then(_otpValidation);
                  // _cardAnimationController.forward();
                  setState(() {});
                },
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
                          lerpDouble(0.0, 340.0, animation)!,
                          (lerpDouble(0.0, -20.0, animation)! +
                              lerpDouble(0.0, -220.0, _cardAnimation.value)!),
                        ),
                      child: Image.asset(
                        'assets/credit-card-0.png',
                        scale: 1.5,
                      ),
                    ),
                  );
                },
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
                child: AnimatedBuilder(
                    animation: _cardAnimation,
                    builder: (context, child) {
                      return _AtmTerminal(
                        leading: Text(
                          _cardAnimation.value < 0.5
                              ? "Insert Card"
                              : "Verifying card...",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
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

  Widget _buildOTPState() {
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
        Positioned.fill(
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: AnimatedBuilder(
                    animation: _otpAnimation,
                    builder: (context, child) {
                      return _AtmTerminal(
                        leading: FadeInUp(
                          child: _otpAnimation.value > 0.9
                              ? Opacity(
                                  opacity: _otpAnimation.value,
                                  child: Text('Done'))
                              : Opacity(
                                  opacity: 1 - _otpAnimation.value,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Waiting for OTP',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          4,
                                          (index) => TweenAnimationBuilder(
                                            onEnd: () {
                                              if (index == 3) {
                                                _otpAnimationController
                                                    .forward()
                                                    .then(_printTicket);
                                              }
                                            },
                                            duration: Duration(
                                                milliseconds:
                                                    700 * (index + 1)),
                                            tween: Tween<double>(
                                                begin: 0.1, end: 1.0),
                                            builder:
                                                (context, animation, child) {
                                              return Opacity(
                                                opacity: animation,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(6.0),
                                                    ),
                                                    border: Border.all(
                                                        width: 1.0,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      );
                    }),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPrintTicketState() {
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
            duration: const Duration(milliseconds: 800),
            builder: (context, animation, child) {
              return Transform.translate(
                offset: Offset(0.0, lerpDouble(0, 95, animation)!),
                child: Container(
                  color: Colors.transparent,
                  height: MediaQuery.sizeOf(context).height * 0.13,
                  width: MediaQuery.sizeOf(context).width * 0.14,
                  child: TicketCard(),
                ),
              );
            }
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


class _AtmTerminal extends StatelessWidget {
  const _AtmTerminal({
    super.key,
    required this.leading,
  });

  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
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
          Positioned(
            bottom: (constraints.maxHeight * 0.2),
            left: 0,
            right: 0,
            child: Center(
              child: leading,
            ),
          ),
        ],
      );
    });
  }
}
