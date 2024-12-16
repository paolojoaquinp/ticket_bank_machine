class BusTicket {
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String departureLocation;
  final String arrivalLocation;
  final String passengerName;
  final String seatNumber;
  final String terminal;
  final String gate;
  final String busNumber;

  BusTicket({
    required this.departureTime,
    required this.arrivalTime,
    required this.departureLocation,
    required this.arrivalLocation,
    required this.passengerName,
    required this.seatNumber,
    required this.terminal,
    required this.gate,
    required this.busNumber,
  });


  static BusTicket fakeValue = BusTicket(
    departureTime: DateTime(2023, 11, 20, 21, 32),
    arrivalTime: DateTime(2023, 11, 21, 8, 22),
    departureLocation: 'BLR',
    arrivalLocation: 'NGP',
    passengerName: 'Jitu Raut',
    seatNumber: 'D12',
    terminal: 'T6',
    gate: '21',
    busNumber: 'BH29187',
  );
}