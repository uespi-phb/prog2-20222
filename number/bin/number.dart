import 'dart:math';

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
      sum += pow(number % 10, digits).toInt();
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
}
