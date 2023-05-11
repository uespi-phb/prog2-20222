import './rational.dart';

void main() {
  final r1 = Rational(1, 3);
  final r2 = Rational(2, -5);
  final rationals = [
    r1,
    r2,
    Rational(),
    Rational(7),
    Rational(36, 12),
    Rational(3, -2),
    Rational.from(r1),
    Rational.fromString('7/-4'),
    r2.simplify(),
    r1 + r2,
    r1 - r2,
    r1 * r2,
    r1 / r2,
    -r1,
  ];

  for (int i = 0; i < rationals.length; i++) {
    print('r${i + 1} = ${rationals[i]}');
  }
}
