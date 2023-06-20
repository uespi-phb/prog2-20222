abstract class Animal {
  String _name;
  int _age;

  Animal(this._name, this._age);

  String get name => _name;
  int get age => _age;

  set name(String text) {
    if (text.length < 3) {
      throw Exception('Animal name must have at least 3 characteres');
    }
    _name = text;
  }

  set age(int animalAge) {
    if (animalAge <= 0) {
      throw Exception('Animal age must be major than zero');
    }
    _age = animalAge;
  }

  String makeSound();
}
