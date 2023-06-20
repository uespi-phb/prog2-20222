import './animal.dart';

class Bird extends Animal {
  final String _sound;

  Bird(super._name, super._age, this._sound);

  @override
  String makeSound() {
    return '$name $_sound';
  }
}
