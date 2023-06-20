import './animal.dart';

class Reptile extends Animal {
  final String _sound;

  Reptile(super._name, super._age, this._sound);

  @override
  String makeSound() => '$name $_sound';
}
