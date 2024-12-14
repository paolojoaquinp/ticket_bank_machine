part of 'payment_terminal_bloc.dart';

sealed class PaymentTerminalEvent extends Equatable {
  const PaymentTerminalEvent();

}


class PaymentTerminalInitialEvent extends PaymentTerminalEvent {
  const PaymentTerminalInitialEvent();

  @override
  List<Object> get props => [];
}

class IntroduceCreditCard extends PaymentTerminalEvent {
  const IntroduceCreditCard();

  @override
  List<Object> get props => [];
}