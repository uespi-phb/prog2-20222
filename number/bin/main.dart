import 'number.dart';

void main() {
  Number z = Number();
  Number n1 = Number(653);

  print('z  = $z');
  print('n1 = $n1');

  print('z.zero(): ${z.zero}');
  print('n1.prime(): ${n1.prime}');
  print('n1.narc(): ${n1.narcissistic}');
  print('n1!: ${n1.factorial}');
  print('sqrt(n1): ${n1.sqrt}');
  print('n1.digitsSum(10): ${n1.digitsSum()}');
  print('n1.reverse: ${n1.reverse}');
  print('n1.toBase(2): ${n1.toBase(16, false)}');
}
