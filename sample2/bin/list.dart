void main() {
  var even = [0, 2, 4, 6];
  var odd = [1, 3, 5, 7];

  var strEven = even.map((e) => e.toString());
  print(strEven.toList());

  var numbers = [
    ...even,
    ...odd,
  ];

  print(even);
  print(odd);
  print(numbers);
}
