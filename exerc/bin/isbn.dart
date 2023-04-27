import 'dart:io';

void main() {
  const nullISBN = '0000000000';
  String input, candidate;

  do {
    input = stdin.readLineSync() ?? nullISBN;
    input = input.trim();
    candidate = input.replaceAll(RegExp(r'[^0-9X]'), '');
    if (candidate == nullISBN) {
      break;
    }

    if (isValidISBN(candidate)) {
      print('$input está correto.');
    } else {
      print('$input está incorreto.');
    }
  } while (true);
}

bool isValidISBN(String isbn) {
  if (isbn.length != 10) {
    return false;
  }

  int sum1, sum2, value;

  sum1 = sum2 = 0;
  for (int i = 0; i < isbn.length; i++) {
    value = int.tryParse(isbn[i]) ?? 10;

    sum1 += value;
    sum2 += sum1;
  }

  return sum2 % 11 == 0;
}
