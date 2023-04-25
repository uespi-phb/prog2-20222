/*
O Máximo Divisor Comum, ou simplesmente MDC, entre dois números naturais a e b
diferentes de zero é definido como sendo o maior número inteiro que divide 
simultaneamente a e b. Um método simples para calcular o MDC entre dois
números é o Algoritmo de Euclides que é definido pelas seguintes propriedades:
  1) MDC(a,0) = a
  2) MDC(a,b) = MDC(b,a), se a < b
  3) MDC (a,b) = MDC (b, a mod b), se a >= b
Escreva uma função que receba dois inteiros como parâmetros e 
retorne o MDC entre estes dois números.
*/

import 'dart:io';

void main() {
  int a, b, n;

  stdout.write('1o número: ');
  a = int.parse(stdin.readLineSync() ?? '0');
  stdout.write('2o número: ');
  b = int.parse(stdin.readLineSync() ?? '0');

  print('Versão Iterativa');
  n = mdcIter(a, b);
  print('MDC($a,$b) = $n');

  print('Versão Recursiva');
  n = mdcRec(a, b);
  print('MDC($a,$b) = $n');
}

int mdcIter(int a, int b) {
  int t;

  while (b != 0) {
    if (a >= b) {
      t = a;
      a = b;
      b = t % b;
    } else {
      t = a;
      a = b;
      b = t;
    }
  }
  return a;
}

int mdcRec(int a, int b) {
  if (b == 0) {
    return a;
  } else if (a > b) {
    return mdcRec(b, a % b);
  } else {
    return mdcRec(b, a);
  }
}
