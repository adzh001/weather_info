import 'package:intl/intl.dart';

getDateFormat(int date) {
  var millis = date;
  var dt = DateTime.fromMillisecondsSinceEpoch(millis * 1000);

// 24 Hour format:
  return DateFormat('dd.MMMM.yyyy \n       HH:mm').format(dt);
}

int getTemp(double temp) {
  int celcius = (temp - 273.15).toInt();
  return celcius;
}
