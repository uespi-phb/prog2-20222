/*
Escreva um programa que receba vários números, calcule e mostre:
a) a soma dos números digitados;
b) a quantidade de números digitado;
c) a média dos números digitados;
d) o maior número digitado;
e) o menor número digitado;
f) a média dos números pares.
*/

import 'dart:io';

void main() {
  String input;
  int data, sum, count, major, minor, evenSum, evenCount;
  double average, evenAverage;

  count = evenCount = 0;
  sum = evenSum = 0;
  major = minor = 0;

  do {
    stdout.write('> ');
    input = stdin.readLineSync() ?? '';
    if (input.isEmpty) {
      break;
    }
    data = int.parse(input);

    count++;
    sum += data;

    if (data.isEven) {
      evenCount++;
      evenSum += data;
    }

    if (count > 1) {
      if (data > major) {
        major = data;
      }
      if (data < minor) {
        minor = data;
      }
    } else {
      major = data;
      minor = data;
    }
  } while (true);

  if (count > 0) {
    average = sum / count;
    evenAverage = (evenCount > 0) ? evenSum / evenCount : 0;

    print('Soma dos números digitados     : $sum');
    print('Quantidade de números digitados: $count');
    print('Média dos números digitados    : $average');
    print('Maior número digitado          : $major');
    print('Menor número digitado          : $minor');
    print('Média dos números pares        : $evenAverage');
  } else {
    print('Não foram digitados números!');
  }
}
