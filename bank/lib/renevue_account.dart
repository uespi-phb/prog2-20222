import './account.dart';
import 'utils.dart';

abstract class RevenueAccount extends Account {
  final double interest;

  RevenueAccount({
    required super.name,
    required super.agency,
    required super.account,
    required this.interest,
  });

  RevenueAccount.open({
    required String name,
    required int agency,
    required this.interest,
  }) : super.open(name: name, agency: agency);

  @override
  void statement() {
    final width = Account.statementWidth;
    final tabs = [
      width ~/ 2,
      -(width - (width ~/ 2)),
    ];

    super.statement();

    final value = interest * 100.0;
    tabPrint('TAXA JUROS (AA):\t${value.toStringAsFixed(2)}%', tabs);
  }

  void computeInterest();
}
