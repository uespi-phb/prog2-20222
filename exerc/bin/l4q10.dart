/*
Um número "a" é dito permutação de um número "b" se os dígitos de "a" formam 
uma permutação dos dígitos de "b". Por exemplo, "5412" é uma permutação 
de "5214", mas não é uma permutação de "5211". 
Escreva uma função que lê dois inteiros positivos "a" e "b' e verifique
se "a" é permutação de "b".
*/

import 'dart:io';

void main() {
  int a, b;

  stdout.write('1o número: ');
  a = int.parse(stdin.readLineSync() ?? '0');
  stdout.write('2o número: ');
  b = int.parse(stdin.readLineSync() ?? '0');

  if (isPermutation(a, b)) {
    print('$b é uma permutação de $a');
  } else {
    print('$b não é uma permutação de $a');
  }
}

bool isPermutation(int a, int b) {
  int charCount(String char, String string) {
    int counter = 0;

    for (int i = 0; i < string.length; i++) {
      if (string[i] == char) {
        counter++;
      }
    }
    return counter;
  }

  String aDigits = a.toString();
  String bDigits = b.toString().padLeft(aDigits.length, '0');

  if (aDigits.length != bDigits.length) {
    return false;
  }

  for (int i = 0; i < aDigits.length; i++) {
    int aDigitCount = charCount(aDigits[i], aDigits);
    int bDigitCount = charCount(aDigits[i], bDigits);
    if (aDigitCount != bDigitCount) {
      return false;
    }
  }
  return true;
}

bool isPermutationV1(int a, int b) {
  String aDigits = a.toString();
  String bDigits = b.toString().padLeft(aDigits.length, '0');

  if (aDigits.length != bDigits.length) {
    return false;
  }

  for (int i = 0; i < aDigits.length; i++) {
    int aDigitCount = aDigits[i].allMatches(aDigits).length;
    int bDigitCount = aDigits[i].allMatches(bDigits).length;
    if (aDigitCount != bDigitCount) {
      return false;
    }
  }
  return true;
}
