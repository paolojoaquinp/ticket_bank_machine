import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_terminal_event.dart';
part 'payment_terminal_state.dart';

class PaymentTerminalBloc extends Bloc<PaymentTerminalEvent, PaymentTerminalState> {
  PaymentTerminalBloc() : super(PaymentTerminalInitial()) {
    on<PaymentTerminalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
