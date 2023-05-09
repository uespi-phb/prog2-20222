class Rational {
  int num;
  int den;

  Rational([this.num = 0, this.den = 1]);

  Rational.from(Rational r)
      : num = r.num,
        den = r.den;

  Rational.fromString(String s)
      : num = 0,
        den = 1 {
    final numbers = s.split('/');
    num = int.parse(numbers[0]);
    den = int.parse(numbers[1]);
  }

  @override
  String toString() {
    return '$num/$den';
  }
}
