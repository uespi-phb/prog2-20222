import './animal.dart';

class Zoo {
  final List<Animal> _animals = [];

  void addAnimal(Animal animal) {
    _animals.add(animal);
  }

  void listAnimal() {
    for (final animal in _animals) {
      print(animal.makeSound());
    }
  }

  void sortByName() {
    _animals.sort(
      (animal1, animal2) => animal1.name.compareTo(animal2.name),
    );
  }
}
