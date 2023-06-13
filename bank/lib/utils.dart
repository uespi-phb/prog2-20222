/*
 * Exibe texto tabulado no console
 */
import 'dart:io';

void tabPrint(
  String text, [
  List<int> tabs = const [],
]) {
  final data = text.split('\t');

  for (int i = 0; i < data.length; i++) {
    text = data[i].trim();
    if (i < tabs.length) {
      if (tabs[i] > 0) {
        text = text.padRight(tabs[i]);
      } else if (tabs[i] < 0) {
        text = text.padLeft(tabs[i].abs());
      }
    }
    stdout.write(text);
  }
  stdout.write('\n');
}

centerPrint(String text, int width) {
  final len = text.length;
  final gap = (len < width) ? ' ' * ((width - len) ~/ 2) : '';
  print('$gap$text');
}

String dateToDDMM(DateTime date) {
  return '${date.day ~/ 10}${date.day % 10}/${date.month ~/ 10}${date.month % 10}';
}

double calculateInterest(
  double value,
  double interestPerMonth,
  int periodInDays,
) =>
    (interestPerMonth / 3000.0) * periodInDays * value;

DateTime firstMomentNextDay(DateTime date) {
  DateTime nextDay = date.add(Duration(hours: 24));
  return DateTime(
    nextDay.year,
    nextDay.month,
    nextDay.day,
  );
}
