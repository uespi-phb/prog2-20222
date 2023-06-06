import './renevue_account.dart';

class SavingAccount extends RevenueAccount {
  SavingAccount({
    required super.name,
    required super.agency,
    required super.account,
    required super.interest,
  });

  SavingAccount.open({
    required String name,
    required int agency,
    required double interest,
  }) : super.open(name: name, agency: agency, interest: interest);

  @override
  double get availableBalance => balance;

  @override
  void computeInterest() {
    final interestValue = balance * interest;
    if (interestValue <= 0.0) {
      return;
    }
  }
}
