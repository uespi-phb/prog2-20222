import 'dart:io';

void main() {
  int n1, n2;
  String? data;

  stdout.write('Informe um número: ');
  data = stdin.readLineSync();
  data = (data == '') || (data == null) ? '0' : data;
  n1 = int.parse(data);

  stdout.write('Informe outro número: ');
  data = stdin.readLineSync();
  data = (data == '') || (data == null) ? '0' : data;
  n2 = int.parse(data);

  if (n1 > n2) {
    print('$n1 é maior que $n2');
  } else if (n1 < n2) {
    print('$n2 é maior qe $n1');
  } else {
    print('$n1 é igual a $n2');
  }
}
