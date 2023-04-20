import 'dart:io';

// Verify if first int is multiple of the second

void main() {
  int n1, n2;
  String value;

  stdout.write('Primeiro número: ');
  value = stdin.readLineSync() ?? '0';
  value = (value != '') ? value : '0';
  n1 = int.parse(value);

  stdout.write('Segundo  número: ');
  value = stdin.readLineSync() ?? '0';
  value = (value != '') ? value : '0';
  n2 = int.parse(value);

  if (n1 % n2 == 0) {
    print('$n1 é múltiplo de $n2');
  } else {
    print('$n1 não é múltiplo de $n2');
  }
}
