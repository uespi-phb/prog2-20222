import 'dart:math';

import 'package:bank/account.dart';
import 'package:bank/current_account.dart';
import 'package:bank/renevue_account.dart';
import 'package:bank/investment_account.dart';
import 'package:bank/saving_account.dart';
import 'package:bank/special_account.dart';
import 'package:bank/transaction.dart';
import 'package:faker/faker.dart';

final Random _rnd = Random();

void main() {
  List<Account> accounts = [];

  for (int i = 0; i < 5; i++) {
    accounts.add(randomAccount());
  }

  for (final account in accounts) {
    account.statement();
    print(account);
    print('*' * 80);
  }
}

AccountType randomAccountType() {
  final index = _rnd.nextInt(AccountType.values.length);
  return AccountType.values[index];
}

TransactionType randomTransactionType() {
  final index = _rnd.nextInt(TransactionType.values.length);
  return TransactionType.values[index];
}

Account randomAccount() {
  final Account account;
  final name = faker.person.name().toUpperCase();
  final agency = _rnd.nextInt(100) + 10;
  final limit = (_rnd.nextInt(501) + 100) * 10.0;
  final interest = (_rnd.nextInt(50) + 1) / 1000.0;

  switch (randomAccountType()) {
    case AccountType.current:
      account = CurrentAccount.open(
        name: name,
        agency: agency,
      );
      break;

    case AccountType.special:
      account = SpecialAccount.open(
        name: name,
        agency: agency,
        limit: limit,
      );
      break;

    case AccountType.saving:
      account = SavingAccount.open(
        name: name,
        agency: agency,
      );
      break;

    case AccountType.investment:
      account = InvestmentAccount.open(
        name: name,
        agency: agency,
        interest: interest,
      );
      break;
  }

  randomTransactions(account);

  return account;
}

void randomTransactions(Account account) {
  int count = _rnd.nextInt(10);

  account.deposit((_rnd.nextInt(500000) + 50000) / 100.0);

  while (count > 0) {
    final transType = randomTransactionType();
    final value = (_rnd.nextInt(50000) + 5000) / 100.0;

    if (transType.nature == TransactionNature.credit) {
      account.credit(transType, value);
    } else {
      account.debit(transType, value);
    }

    count--;
  }
  if (account is RevenueAccount) {
    account.computeInterest();
  }
}
