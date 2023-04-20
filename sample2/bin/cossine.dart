/*
Um valor aproximado de cos(x) por ser calculado pela seguinte série:

  cos(x) ≅ 1 − x^2/2! + x^4/4! - x^6/6! + ...

Escreva um programa que recebe um ângulo x como entrada e calcula seu co-seno 
pela soma dos 100 primeiros termos da série acima.
*/

import 'dart:io';

void main() {
  int maxTerms = 20;
  int k, sig;
  double angle, sum, num, den;

  stdout.write('Ângulo: ');
  angle = double.parse(stdin.readLineSync() ?? '0');

  num = den = 1;
  sum = 1;
  sig = -1;
  k = 2;
  while (--maxTerms > 0) {
    num = num * angle * angle;
    den = den * (k - 1) * k;
    sum += sig * num / den;

    k += 2;
    sig = -sig;
  }

  print('cos($angle) = $sum');
}
