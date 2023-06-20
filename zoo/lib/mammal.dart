import './animal.dart';

class Mammal extends Animal {
  final String _sound;

  // Mammal(String name, int age, String sound) : _sound = sound, super(name, age);
  Mammal(super._name, super._age, this._sound);

  @override
  String makeSound() {
    return '$name $_sound';
  }
}
