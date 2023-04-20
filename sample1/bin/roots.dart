import 'dart:io';
import 'dart:math';

void main() {
  double a, b, c;

  stdout.write('Informe a: ');
  a = double.parse(stdin.readLineSync() ?? '0');
  stdout.write('Informe b: ');
  b = double.parse(stdin.readLineSync() ?? '0');
  stdout.write('Informe c: ');
  c = double.parse(stdin.readLineSync() ?? '0');

  if (a != 0.0) {
    double x1, x2;
    var delta = b * b - 4 * a * c;

    if (delta >= 0.0) {
      x1 = (-b + sqrt(delta)) / (2 * a);
      x2 = (-b - sqrt(delta)) / (2 * a);

      print('x1 = $x1');
      print('x2 = $x2');
    } else {
      double real, imag;

      real = -b / (2 * a);
      imag = sqrt(delta.abs()) / (2 * a);

      print('x1 = $real + ${imag}i');
      print('x1 = $real - ${imag}i');
    }
  } else if (b != 0) {
    print('x1 = ${-c / b}');
  } else {
    print('Não é equação do 1o ou 2o graus');
  }
}
