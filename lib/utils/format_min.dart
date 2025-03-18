import 'package:intl/intl.dart';

String formatMin(DateTime date){

  final DateFormat formatter = DateFormat('m');
  final String formatted = formatter.format(date);
  return formatted;
}