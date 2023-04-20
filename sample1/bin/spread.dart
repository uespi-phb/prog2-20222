void main() {
  List<int>? list0 = [9, 9, 9];
  var list1 = [1, 2, 3];
  var list2 = [0, list1];
  var list3 = [0, ...list1];
  var list4 = [0, ...list0];

  print('list0 = $list0');
  print('list1 = $list1');
  print('list2 = $list2');
  print('list3 = $list3');
  print('list4 = $list4');
}
