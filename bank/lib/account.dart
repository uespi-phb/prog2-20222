import './transaction.dart';

abstract class Account {
  static final Map<int, int> _accountNumber = {};

  final String name;
  final int agency;
  int account;

  final List<Transaction> transactions = [];

  Account({
    required this.name,
    required this.agency,
    required this.account,
  });

  Account.open({
    required this.name,
    required this.agency,
  }) : account = 0 {
    _setAccountNumber();
  }

  void _setAccountNumber() {
    final lastNumber = _accountNumber[agency];

    account = (lastNumber != null) ? lastNumber + 1 : 1000;
    _accountNumber[agency] = account;
  }

  void credit(TransactionType type, double value);
  void debit(TransactionType type, double value);

  double get balance => transactions.fold<double>(
        0.0,
        (value, transaction) => value + transaction.value,
      );

  void statement() {
    _statementHeader();
    _statementTransactions();
    _statementSummary();
  }

  void _statementHeader() {}

  void _statementTransactions() {}

  void _statementSummary() {}
}
