import 'dart:io';

void main() {
  String? name;

  stdout.write('Informe seu nome: ');
  name = stdin.readLineSync();
  stdout.write('Olá, $name.\n');
}
