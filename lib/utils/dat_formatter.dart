import 'package:intl/intl.dart';

String formatDay(DateTime date){

  final DateFormat formatter = DateFormat('E');
  final String formatted = formatter.format(date);
  return formatted;
}