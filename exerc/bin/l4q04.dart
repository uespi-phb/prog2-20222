/*
Faça uma função que recebe como parâmetro uma medida de tempo expressa 
em segundos e retorna esse tempo em horas, minutos e segundos como uma
string no formato "hh:mm:ss"
*/

String formatTime(int time) {
  String hour, minute, second;

  hour = (time ~/ 3600).toString().padLeft(2, '0');
  time = time % 3600; // time %= 3600
  minute = (time ~/ 60).toString().padLeft(2, '0');
  second = (time % 60).toString().padLeft(2, '0');

  return '$hour:$minute:$second';
}

void main() {
  print(formatTime(4626));
  print(formatTime(123));
  print(formatTime(598));
  print(formatTime(3434432));
}
