import './point.dart';
import './shape.dart';

class Rect extends Shape {
  final double height;
  final double width;

  Rect({
    String name = 'Rect',
    required this.height,
    required this.width,
    Point? center,
  }) : super(
          name: name,
          center: center,
        );

  @override
  void show() {
    super.show();
    print('height  : $height');
    print('width   : $width');
  }

  @override
  double area() => height * width;
  @override
  double perimeter() => 2 * (height + width);
}
