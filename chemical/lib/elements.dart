import 'dart:io';

import './element.dart';

class Elements {
  final Map<String, Element> elements = {};

  Elements._load() {
    final file = File('./elements.csv');

    // Z,Symbol,Name,LatinName

    for (var line in file.readAsLinesSync().sublist(1)) {
      final data = line.split(',');
      final symbol = data[1];
      final weight = int.parse(data[0]);
      final element = Element(
        symbol: symbol,
        name: data[2],
        latinName: data[3],
        weight: weight,
      );

      elements[symbol] = element;
    }
  }

  bool isValidSymbol(String symbol) => periodicTable.elements[symbol] != null;
}

final periodicTable = Elements._load();
