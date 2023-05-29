enum TransactionType {
  deposit,
  withdraw,
  transfer,
  payment,
}

class Transaction {
  final DateTime date;
  final TransactionType type;
  final double value;

  Transaction({
    required this.type,
    required this.value,
  }) : date = DateTime.now();

  Transaction.fromDate({
    required this.date,
    required this.type,
    required this.value,
  });

  bool get credit => value >= 0.0;
  bool get dedit => value < 0.0;
}
