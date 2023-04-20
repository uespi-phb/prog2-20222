/*
Dada uma seqüência de N números reais, determinar os números que 
compõem a seqüência e o número de vezes que cada um deles ocorre na mesma.

Exemplo  : N = 8
Seqüência: -1.7, 3.0, 0.0, 1.5, 0.0, -1.7, 2.3, -1,7
Saída:
 -1.7 ocorre 3 vezes
  3.0 ocorre 1 vez
  0.0 ocorre 2 vezes
  1.5 ocorre 1 vez
  2.3 ocorre 1 vez
*/

import 'dart:io';

void main() {
  List<num> numbers = [];
  Map<num, int> counter = {};
  String data;
  num number;

  print('Informe uma sequência de números:');
  do {
    stdout.write('> ');
    data = stdin.readLineSync() ?? '';
    if (data.isEmpty) {
      break;
    }
    number = num.parse(data);
    if (counter.containsKey(number)) {
      counter[number] = counter[number]! + 1;
    } else {
      counter[number] = 1;
    }

    numbers.add(number);
  } while (true);

  print('Números informados:');
  for (number in numbers) {
    stdout.write('$number ');
  }

  print('\n\nContagem dos números:');
  for (var entry in counter.entries) {
    print('O valor ${entry.key} aparece ${entry.value} vez(es)');
  }

  print('\n\nContagem dos números (ordenado por chave):');
  final keys = List<num>.from(counter.keys);
  keys.sort();

  for (var key in keys) {
    print('O valor $key aparece ${counter[key]} vez(es)');
  }

  print('\n\nContagem dos números (ordenado por valor):');
  final entries = List<MapEntry<num, int>>.from(counter.entries);
  entries.sort(entryCompare);

  for (var entry in entries) {
    print('O valor ${entry.key} aparece ${entry.value} vez(es)');
  }
}

int entryCompare(MapEntry<num, int> e1, MapEntry<num, int> e2) {
  return e2.value - e1.value;
}
