import 'package:chemical/elements.dart';

class Molecule implements Comparable<Molecule> {
  final String formula;
  final Map<String, int> atons = {};

  Molecule(this.formula) {
    _parse(formula);
  }

  void _parse(String expr) {
    final regex = RegExp(r'([A-Z][a-z]?)([0-9]*)');

    for (var match in regex.allMatches(expr)) {
      final symbol = match[0]!;
      final qty = (match[1] != null) ? int.parse(match[1]!) : 1;
      if (!periodicTable.isValidSymbol(symbol)) {
        atons.clear();
        break;
      }
      atons[symbol] = qty;
    }

    if (atons.isEmpty) {
      throw Exception('Invalid chemical formula: $expr');
    }
  }

  int get weight {
    int sum = 0;

    atons.forEach((symbol, quantity) {
      sum += quantity * periodicTable.elements[symbol]!.weight;
    });

    return sum;
  }

  @override
  int compareTo(Molecule other) => weight - other.weight;
}
