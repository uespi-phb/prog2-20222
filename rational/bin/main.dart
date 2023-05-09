import './rational.dart';

void main() {
  Rational r1 = Rational();
  Rational r2 = Rational(7);
  Rational r3 = Rational(5, 3);
  Rational r4 = Rational(3, -2);
  Rational r5 = Rational.from(r3);
  Rational r6 = Rational.fromString('10/7x');

  print('r1=$r1');
  print('r2=$r2');
  print('r3=$r3');
  print('r4=$r4');
  print('r5=$r5');
  print('r6=$r6');
}
