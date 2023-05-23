import './point.dart';
import './elipsis.dart';

class Circle extends Elipsis {
  Circle(
    double radius, {
    Point? center,
  }) : super(
          a: radius,
          b: radius,
          center: center,
          name: 'Circle',
        );

  double get radius => a;

  @override
  String toString() => 'Circle($radius)';

  @override
  void show() {
    super.show();
    print('radius: $radius');
  }
}
