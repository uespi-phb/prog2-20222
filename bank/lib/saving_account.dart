import 'package:bank/transaction.dart';

import './renevue_account.dart';
import 'utils.dart';

class SavingAccount extends RevenueAccount {
  static double monthlySavingInterest = 0.06 / 12.0;

  SavingAccount({
    required String name,
    required int agency,
    required int account,
  }) : super(
          name: name,
          agency: agency,
          account: account,
          interest: monthlySavingInterest,
        );

  SavingAccount.open({
    required String name,
    required int agency,
  }) : super.open(
          name: name,
          agency: agency,
          interest: monthlySavingInterest,
        );

  @override
  double get availableBalance => balance;

  @override
  void computeInterest() {
    double value = 0.0;
    DateTime? lastDate;

    for (var trans in transactions.reversed) {
      if (trans.type == TransactionType.creditInterest) {
        break;
      }
      lastDate = trans.date;
      value += trans.value;
    }
    if ((value > 0.0) && (lastDate != null)) {
      final periodInDays = DateTime.now().difference(lastDate).inDays;
      final interestValue = calculateInterest(value, interest, periodInDays);

      credit(TransactionType.creditInterest, interestValue);
    }
  }
}
