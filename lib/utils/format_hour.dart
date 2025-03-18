import 'package:intl/intl.dart';


String formatHour(DateTime date){

  final DateFormat formatter = DateFormat('H');
  final String formatted = formatter.format(date);
  return formatted;
}