class Point {
  final double x;
  final double y;

  Point([this.x = 0, this.y = 0]);

  @override
  String toString() {
    return '(${x.toStringAsFixed(1)},${y.toStringAsFixed(1)})';
  }
}
