import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_terminal_event.dart';
part 'payment_terminal_state.dart';

class PaymentTerminalBloc extends Bloc<PaymentTerminalEvent, PaymentTerminalState> {
  PaymentTerminalBloc() : super(PaymentTerminalInitial()) {
    on<PaymentTerminalEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PaymentTerminalInitialEvent>(_onPaymentTerminalInitialEvent);
    on<IntroduceCreditCard>(_onIntroduceCreditCard);
  }

  Future<void> _onPaymentTerminalInitialEvent(PaymentTerminalInitialEvent event, Emitter<PaymentTerminalState> emit) async {
    emit(const PaymentTerminalInitialState());
    await Future.delayed(const Duration(milliseconds: 2000),() {
    });
    emit(const PaymentTerminalInsertCardState());    
  }

  Future<void> _onIntroduceCreditCard(IntroduceCreditCard event, Emitter<PaymentTerminalState> emit) async {
    
  }
}
