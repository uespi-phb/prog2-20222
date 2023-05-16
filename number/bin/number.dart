import 'dart:math' as math;

class Number {
  final int _number;

  Number([this._number = 0]);

  @override
  String toString() => '$_number';

  bool get zero => _number == 0;
  bool get positive => _number > 0;
  bool get negative => _number < 0;
  bool get even => _number % 2 == 0;
  bool get odd => _number % 2 != 0;

  bool get prime {
    if (_number <= 1) {
      return false;
    }
    for (int d = 2; d < _number; d++) {
      if (_number % d == 0) {
        return false;
      }
    }
    return true;
  }

  bool get narcissistic {
    int digits = length();
    int sum = 0;
    int number = _number;

    while (number != 0) {
      sum += math.pow(number % 10, digits).toInt();
      number ~/= 10;
    }

    return sum == _number;
  }

  int length([int base = 10]) {
    int number = _number;
    int digits = 0;

    while (number != 0) {
      number = number ~/ base;
      digits++;
    }

    return (_number != 0) ? digits : 1;
  }

  int get factorial {
    int result = 1;
    for (var k = 2; k <= _number; k++) {
      result *= k;
    }
    return result;
  }

  double get sqrt => math.sqrt(_number);
  int get sqr => _number * _number;

  int digitsSum([int base = 10]) {
    int sum = 0;
    int number = _number;

    if (base < 2) {
      throw Exception('Invalid base: $base');
    }

    while (number != 0) {
      sum += number % base;
      number = number ~/ base;
    }
    return sum;
  }

  int get reverse {
    int sum = 0;
    int number = _number;

    while (number != 0) {
      sum = sum * 10 + (number % 10);
      number ~/= 10;
    }

    return sum;
  }

  String toBase(int base, [bool lowerCase = true]) {
    String result = '';
    int number = _number;

    while (number != 0) {
      int digit = number % base;
      if (digit < 10) {
        result = digit.toString() + result;
      } else {
        digit = lowerCase ? digit + 87 : digit + 55;
        result = String.fromCharCode(digit) + result;
      }
      number ~/= base;
    }
    return result;
  }
}
