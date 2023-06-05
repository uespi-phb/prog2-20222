import './exceptions.dart';
import './transaction.dart';
import './utils.dart';

abstract class Account {
  static const _tabs = [6, 20, -10];
  static int get _tabsWidth => _tabs.fold(0, (sum, tab) => sum + tab.abs());

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

  void _addTransaction(TransactionType type, double value) {
    transactions.add(Transaction(
      type: type,
      value: value,
    ));
  }

  void credit(TransactionType type, double value) {
    if (type.nature != TransactionNature.credit) {
      throw TransactionError('Not is a credit transaction: ${type.name}');
    }
    _addTransaction(type, value);
  }

  void debit(TransactionType type, double value) {
    if (type.nature != TransactionNature.debit) {
      throw TransactionError('Not is a debit transaction: ${type.name}');
    }
    _addTransaction(type, -value);
  }

  double get balance => transactions.fold<double>(
        0.0,
        (value, transaction) => value + transaction.value,
      );

  void statement() {
    _statementHeader();
    _statementTransactions();
    _statementSummary();
  }

  void _statementHeader() {
    final width = _tabsWidth;
    final tabs = [
      width ~/ 2,
      -(width - (width ~/ 2)),
    ];

    centerPrint('BANCO EXEMPLO  S/A', width);
    centerPrint('EXTRATO  DE  CONTA', width);
    centerPrint(name, width);
    tabPrint('AG: $agency\tCONTA: $account', tabs);
    print('-' * _tabsWidth);
  }

  void _statementTransactions() {
    for (final trans in transactions) {
      final date = dateToDDMM(trans.date);

      tabPrint(
          '$date\t${trans.type.description}\t${trans.value.toStringAsFixed(2)}',
          _tabs);
    }
  }

  void _statementSummary() {
    final width = _tabsWidth;
    final tabs = [
      width ~/ 2,
      -(width - (width ~/ 2)),
    ];

    print('-' * _tabsWidth);
    tabPrint('SALDO:\t${balance.toStringAsFixed(2)}', tabs);
  }

  void deposit(double value) {
    credit(TransactionType.deposit, value);
  }

  void withdraw(double value) {
    debit(TransactionType.withdraw, value.abs());
  }

  void payment(double value) {
    debit(TransactionType.payment, value.abs());
  }
}
