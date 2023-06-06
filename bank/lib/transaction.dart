enum TransactionNature {
  debit,
  credit,
}

enum TransactionType {
  deposit(TransactionNature.credit),
  withdraw(TransactionNature.debit),
  creditTransfer(TransactionNature.credit),
  debitTransfer(TransactionNature.debit),
  payment(TransactionNature.debit),
  creditInterest(TransactionNature.credit),
  debitInterest(TransactionNature.debit);

  const TransactionType(this.nature);

  final TransactionNature nature;

  String get description {
    switch (this) {
      case TransactionType.deposit:
        return 'DEPÓSITO';
      case TransactionType.withdraw:
        return 'SAQUE';
      case TransactionType.creditTransfer:
      case TransactionType.debitTransfer:
        return 'TRANSFERÊNCIA';
      case TransactionType.payment:
        return 'PAGAMENTO';
      case TransactionType.creditInterest:
      case TransactionType.debitInterest:
        return 'JUROS';
    }
  }
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
