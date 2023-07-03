import 'package:bank/account.dart';

import './renevue_account.dart';

class SavingAccount extends RevenueAccount {
  static double monthlySavingInterest = 0.06 / 12.0;

  SavingAccount({
    required String name,
    required int agency,
    required int account,
  }) : super(
          accountType: AccountType.saving,
          name: name,
          agency: agency,
          account: account,
          interest: monthlySavingInterest,
        );

  SavingAccount.open({
    required String name,
    required int agency,
  }) : super.open(
          accountType: AccountType.saving,
          name: name,
          agency: agency,
          interest: monthlySavingInterest,
        );
}
