import 'dart:math';

import 'package:bank/account.dart';
import 'package:bank/current_account.dart';
import 'package:bank/special_account.dart';
import 'package:bank/transaction.dart';
import 'package:faker/faker.dart';

final Random _rnd = Random();

void main() {
  List<Account> accounts = [];

  for (int i = 0; i < 4; i++) {
    accounts.add(randomAccount());
  }

  for (final account in accounts) {
    account.statement();
    print(account);
    print('*' * 80);
  }
}

Account randomAccount() {
  final Account account;
  final accountType = _rnd.nextInt(2);
  final name = faker.person.name().toUpperCase();
  final agency = _rnd.nextInt(100) + 10;
  final limit = (_rnd.nextInt(501) + 100) * 10.0;

  switch (accountType) {
    case 1:
      account = SpecialAccount.open(
        name: name,
        agency: agency,
        limit: limit,
      );
      break;

    default:
      account = CurrentAccount.open(
        name: name,
        agency: agency,
      );
  }

  randomTransactions(account);

  return account;
}

void randomTransactions(Account account) {
  int count = _rnd.nextInt(10);

  account.deposit((_rnd.nextInt(500000) + 50000) / 100.0);

  while (count > 0) {
    final index = _rnd.nextInt(TransactionType.values.length);
    final transType = TransactionType.values[index];
    final value = (_rnd.nextInt(50000) + 5000) / 100.0;

    if (transType.nature == TransactionNature.credit) {
      account.credit(transType, value);
    } else {
      account.debit(transType, value);
    }

    count--;
  }
}
