import './rect.dart';
import './point.dart';

class Square extends Rect {
  Square(double edge, {Point? center})
      : super(
          name: 'Square',
          height: edge,
          width: edge,
          center: center,
        );
}
