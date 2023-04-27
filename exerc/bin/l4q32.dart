/*
Escreva uma função que receba uma matriz quadrada gerada aleatoriamente 
e retorne a sua transposta. 
Exiba a matriz original e a transposta na tela.
*/

import 'dart:io';
import 'dart:math';

typedef Matrix<T> = List<List<T>>;

const maxValue = 99;

void main() {
  Matrix<int> matrix = [];
  Matrix<int> transposed;

  matrixRandom(matrix, 5);
  matrixPrint(matrix);

  print('--------------');

  transposed = matrixTranspose(matrix);
  matrixPrint(transposed);
}

void matrixRandom(Matrix<int> matrix, int n) {
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

void matrixPrint(Matrix<int> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    final row = matrix[i];

    for (int j = 0; j < row.length; j++) {
      stdout.write('${row[j].toString().padLeft(maxValue.toString().length)} ');
    }
    stdout.write('\n');
  }
}

Matrix<int> matrixTranspose(Matrix<int> matrix) {
  return Matrix<int>.generate(matrix.length, (int j) {
    List<int> elems = [];
    for (int i = 0; i < matrix.length; i++) {
      elems.add(matrix[i][j]);
    }
    return elems;
  });
}

Matrix<int> matrixTranspose2(Matrix<int> matrix) {
  Matrix<int> transposed = [];

  for (int i = 0; i < matrix.length; i++) {
    transposed.add([]);
    for (int j = 0; j < matrix.length; j++) {
      transposed[i].add(matrix[j][i]);
    }
  }
  return transposed;
}
