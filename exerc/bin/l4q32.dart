/*
Escreva uma função que receba uma matriz quadrada gerada aleatoriamente 
e retorne a sua transposta. 
Exiba a matriz original e a transposta na tela.
*/

import 'dart:io';
import 'dart:math';

typedef Matrix = List<List<int>>;

const maxValue = 99;

void main() {
  Matrix matrix = [];

  matrixRandom(matrix, 10);
  matrixPrint(matrix);
}

void matrixRandom(Matrix matrix, int n) {
  Random rnd = Random();
  List<int> row = [];

  matrix.clear();
  for (int i = 0; i < n; i++) {
    row.clear();
    for (int j = 0; j < n; j++) {
      row.add(rnd.nextInt(maxValue + 1));
    }
    matrix.add(List.from(row));
  }
}

void matrixPrint(Matrix matrix) {
  for (int i = 0; i < matrix.length; i++) {
    final row = matrix[i];

    for (int j = 0; j < row.length; j++) {
      stdout.write('${row[j].toString().padLeft(maxValue.toString().length)} ');
    }
    stdout.write('\n');
  }
}
