import './account.dart';
import './transaction.dart';
import './utils.dart';

abstract class RevenueAccount extends Account {
  final double interest;

  RevenueAccount({
    required super.accountType,
    required super.name,
    required super.agency,
    required super.account,
    required this.interest,
  });

  RevenueAccount.open({
    required super.accountType,
    required super.name,
    required super.agency,
    required this.interest,
  }) : super.open();

  @override
  void statement() {
    final width = Account.statementWidth;
    final tabs = [
      width ~/ 2,
      -(width - (width ~/ 2)),
    ];

    super.statement();

    final value = interest * 100.0;
    tabPrint('TAXA JUROS (AM):\t${value.toStringAsFixed(2)}%', tabs);
  }

  void computeInterest([DateTime? date]) {
    double value = 0.0;
    DateTime? lastDate;

    // if(date == null) {
    //   date = DateTime.now();
    // }
    date ??= DateTime.now();
    date = firstMomentNextDay(date);

    for (var trans in transactions.reversed) {
      if (trans.type == TransactionType.creditInterest) {
        break;
      }
      if (trans.date.isBefore(date)) {
        lastDate = trans.date;
        value += trans.value;
      }
    }
    if ((value > 0.0) && (lastDate != null)) {
      final periodInDays = DateTime.now().difference(lastDate).inDays;
      final interestValue = calculateInterest(value, interest, periodInDays);

      credit(TransactionType.creditInterest, interestValue);
    }
  }

  @override
  double get availableBalance => balance;
}
