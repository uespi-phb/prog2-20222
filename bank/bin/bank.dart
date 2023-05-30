import 'package:bank/account.dart';
import 'package:bank/current_account.dart';

void main() {
  // final rnd = Random();
  // const transCount = 10;

  final accounts = <Account>[
    CurrentAccount(name: 'Fulano de Tal', agency: 123, account: 12880),
    CurrentAccount.open(name: 'Maria Vai com as Outras', agency: 123),
    CurrentAccount.open(name: 'Cicrano Beltrano', agency: 123),
  ];

  accounts[0].deposit(1000.00);
  accounts[0].withdraw(200.00);
  accounts[0].payment(100.00);

  accounts[0].statement();

  // for (int i = 0; i < transCount; i++) {

  // }
}
