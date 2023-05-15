import 'dart:math';

class Rational {
  int _num;
  int _den;

  Rational([this._num = 0, this._den = 1]) {
    _validate();
  }

  Rational.from(Rational r)
      : _num = r._num,
        _den = r._den;

  Rational.fromString(String s)
      : _num = 0,
        _den = 1 {
    final numbers = s.split('/');
    try {
      _num = int.parse(numbers[0]);
      _den = int.parse(numbers[1]);

      _validate();
    } catch (_) {
      throw 'Rational: invalid string format: "$s"';
    }
  }

  void _validate() {
    if (_den == 0) {
      throw 'Rational: denominator cannot be zero: Rational($_num, $_den)';
    }

    if (_den < 0) {
      _num = -_num;
      _den = -_den;
    }
  }

  @override
  String toString() {
    return '$_num/$_den';
  }

  Rational simplify() {
    int k = 2, n = _num, d = _den;

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
        _num * r._den + r._num * _den,
        _den * r._den,
      );

  Rational operator -(Rational r) => Rational(
        _num * r._den - r._num * _den,
        _den * r._den,
      );

  Rational operator *(Rational r) => Rational(
        _num * r._num,
        _den * r._den,
      );

  Rational operator /(Rational r) => Rational(
        _num * r._den,
        _den * r._num,
      );

  Rational operator -() => Rational(
        _num,
        -_den,
      );

  static int _compare(Rational r1, Object r2) {
    double d1 = r1._num / r1._den;
    double d2;

    if (r2 is Rational) {
      d2 = r2._num / r2._den;
    } else if (r2 is int || r2 is double) {
      d2 = (r2 as num).toDouble();
    } else {
      throw Exception('Invalid operand type: $r2');
    }

    return (d1 < d2)
        ? -1
        : (d1 > d2)
            ? 1
            : 0;
  }

  bool operator >(Object r) => _compare(this, r) > 0;
  bool operator <(Object r) => _compare(this, r) < 0;
  bool operator >=(Object r) => _compare(this, r) >= 0;
  bool operator <=(Object r) => _compare(this, r) <= 0;

  @override
  // ignore: hash_and_equals
  bool operator ==(Object r) => _compare(this, r) == 0;
}
