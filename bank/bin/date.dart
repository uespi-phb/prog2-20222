void main() {
  DateTime d1 = DateTime(2023, 3, 5, 10, 4, 0);
  DateTime d2 = DateTime(2023, 3, 5, 10, 4, 0);
  DateTime d3 = DateTime(2023, 3, 5, 10, 6, 0);

  print('d1 < d2: ${d1.isBefore(d2)}');
  print('d2 < d3: ${d2.isBefore(d3)}');
}
