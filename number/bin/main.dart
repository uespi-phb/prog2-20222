import 'number.dart';

void main() {
  Number z = Number();
  Number n1 = Number(9473);

  print('z  = $z');
  print('n1 = $n1');

  print('z.zero(): ${z.zero}');
  print('n1.prime(): ${n1.prime}');
  print('n1.narc(): ${n1.narcissistic}');
}
