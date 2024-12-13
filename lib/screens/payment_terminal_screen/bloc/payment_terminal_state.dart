part of 'payment_terminal_bloc.dart';

sealed class PaymentTerminalState extends Equatable {
  const PaymentTerminalState();
  
}

class PaymentTerminalInitial extends PaymentTerminalState {
  @override
  List<Object> get props => [];
}


class PaymentTerminalInitialState extends PaymentTerminalState {
  const PaymentTerminalInitialState();

  @override
  List<Object> get props => [];
}

class PaymentTerminalLoadingState extends PaymentTerminalState {
  const PaymentTerminalLoadingState();

  @override
  List<Object> get props => [];
}

class PaymentTerminalLoadedState extends PaymentTerminalState {
  const PaymentTerminalLoadedState();

  @override
  List<Object> get props => [];
}