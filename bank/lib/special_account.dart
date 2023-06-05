import './account.dart';
import 'utils.dart';

class SpecialAccount extends Account {
  // SpecialAccount({
  //   required String name,
  //   required int agency,
  //   required int account,
  //   required this.limit,
  // }) : super(name: name, agency: agency, account: account);

  double limit;

  SpecialAccount({
    required super.name,
    required super.agency,
    required super.account,
    required this.limit,
  });

  SpecialAccount.open({
    required String name,
    required int agency,
    required this.limit,
  }) : super.open(name: name, agency: agency);

  @override
  void statement() {
    final width = Account.tabsWidth;
    final tabs = [
      width ~/ 2,
      -(width - (width ~/ 2)),
    ];

    super.statement();

    tabPrint('LIMITE:\t${limit.toStringAsFixed(2)}', tabs);
    tabPrint('DISPONÍVEL:\t${balance.toStringAsFixed(2)}', tabs);
  }
}
