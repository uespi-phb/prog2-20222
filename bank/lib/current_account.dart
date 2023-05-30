import 'package:bank/account.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.name,
    required super.agency,
    required super.account,
  });

  CurrentAccount.open({
    required String name,
    required int agency,
  }) : super.open(name: name, agency: agency);
}
