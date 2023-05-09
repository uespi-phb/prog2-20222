void main() {
  print(fibList(20));

  for (var k in fibIter(20)) {
    print(k);
  }

  print(fibIter(20));
}

Iterable<int> fibIter(int n) sync* {
  int k, k1, k2;

  k1 = 1;
  k2 = 0;
  while (n > 0) {
    k = k1 + k2;
    yield k;

    k1 = k2;
    k2 = k;
    n--;
  }
}

List<int> fibList(int n) {
  int k, k1, k2;
  List<int> numbers = [];

  k1 = 1;
  k2 = 0;
  while (n > 0) {
    k = k1 + k2;
    numbers.add(k);

    k1 = k2;
    k2 = k;
    n--;
  }
  return numbers;
}
