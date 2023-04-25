void printInt(int elem) {
  print('$elem ');
}

void printStr(String elem) {
  print('"$elem" ');
}

void main() {
  var listInt = [1, 2, 3, 4, 5];
  var listStr = ['Uespi', 'Parnaiba', 'Computação'];

  // ignore: prefer_function_declarations_over_variables
  var anon = (elem) {
    print(elem);
  };

  anon(1000);

  listInt.forEach(printInt);
  listStr.forEach(printStr);
  print('----------------');
  // ignore: avoid_function_literals_in_foreach_calls
  listInt.map((elem) {
    print(elem);
  });
  // ignore: avoid_function_literals_in_foreach_calls
  listStr.forEach((elem) {
    print('"$elem"');
  });
  print('----------------');
  listStr.map((s) {
    return s.length;
  }).forEach(print);

  listStr.map((s) {
    return '<$s,${s.length}>';
  }).forEach(print);
}
