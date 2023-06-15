import 'package:bank/account.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.name,
    required super.agency,
    required super.account,
  }) : super(accountType: AccountType.current);

  CurrentAccount.open({
    required super.name,
    required super.agency,
  }) : super.open(
          accountType: AccountType.current,
        );

  @override
  double get availableBalance => balance;
}
