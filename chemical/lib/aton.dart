import './elements.dart';

class Aton {
  final String symbol;

  Aton(this.symbol) {
    if (!periodicTable.isValidSymbol(symbol)) {
      throw Exception('Invalid chemical element symbol: $symbol');
    }
  }

  String get name => periodicTable.elements[symbol]!.name;
  String get latinName => periodicTable.elements[symbol]!.latinName;
  int get weight => periodicTable.elements[symbol]!.weight;

  @override
  String toString() => symbol;
}
