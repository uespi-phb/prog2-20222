import 'package:zoo/bird.dart';
import 'package:zoo/reptile.dart';
import 'package:zoo/mammal.dart';
import 'package:zoo/zoo.dart';

void main() {
  final zoo = Zoo();

  zoo.addAnimal(Bird('Papagaio', 87, 'fala'));
  zoo.addAnimal(Mammal('Leão', 12, 'ruge'));
  zoo.addAnimal(Reptile('Cobra', 2, 'sibila'));
  zoo.addAnimal(Bird('Sabiá', 1, 'canta'));
  zoo.addAnimal(Mammal('Cavalo', 7, 'relincha'));
  zoo.addAnimal(Mammal('Cachorro', 9, 'late'));
  zoo.addAnimal(Reptile('Jacaré', 5, 'grunhe'));

  zoo.listAnimal();
  print('----------------');
  zoo.sortByName();
  zoo.listAnimal();
}
