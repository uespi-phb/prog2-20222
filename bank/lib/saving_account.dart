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
}

void sample() {
  SavingAccount ss = SavingAccount(
    name: 'Fulano',
    agency: 100,
    account: 312312,
  );
  DateTime d1 = DateTime.now();

  ss.computeInterest();
  ss.computeInterest(d1);
}
