import 'package:intl/intl.dart';

String formatTime(DateTime date){

  final DateFormat formatter = DateFormat('Hm');
  final String formatted = formatter.format(date);
  return formatted;
}