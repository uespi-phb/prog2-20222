import 'dart:math';

class Rational {
  int num;
  int den;

  Rational([this.num = 0, this.den = 1]) {
    _validate();
  }

  Rational.from(Rational r)
      : num = r.num,
        den = r.den;

  Rational.fromString(String s)
      : num = 0,
        den = 1 {
    final numbers = s.split('/');
    try {
      num = int.parse(numbers[0]);
      den = int.parse(numbers[1]);

      _validate();
    } catch (_) {
      throw 'Rational: invalid string format: "$s"';
    }
  }

  void _validate() {
    if (den == 0) {
      throw 'Rational: denominator cannot be zero: Rational($num, $den)';
    }

    if (den < 0) {
      num = -num;
      den = -den;
    }
  }

  @override
  String toString() {
    return '$num/$den';
  }

  Rational simplify() {
    int k = 2, n = num, d = den;

    while (k <= min(n, d)) {
      if ((n % k == 0) && (d % k) == 0) {
        n = n ~/ k;
        d = d ~/ k;
      } else {
        k++;
      }
    }
    return Rational(n, d);
  }

  Rational operator +(Rational r) => Rational(
        num * r.den + r.num * den,
        den * r.den,
      );

  Rational operator -(Rational r) => Rational(
        num * r.den - r.num * den,
        den * r.den,
      );

  Rational operator *(Rational r) => Rational(
        num * r.num,
        den * r.den,
      );

  Rational operator /(Rational r) => Rational(
        num * r.den,
        den * r.num,
      );

  Rational operator -() => Rational(
        num,
        -den,
      );
}
