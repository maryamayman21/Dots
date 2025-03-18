//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:time_planner/time_planner.dart';
// import 'package:todoapp/utils/date_formatter_util.dart';
// import 'package:todoapp/utils/format_hour.dart';
// import 'package:todoapp/utils/task_color_provider.dart';
//
// import '../database/model/task.dart';
// import 'dat_formatter.dart';
// class TimePlannerProvider {
//  static List<TimePlannerTitle> headers = [];
//   //List<Task> tasks = [];
//   static  int calculateDuration(DateTime startTime, DateTime endTime) {
//     Duration duration = endTime.difference(startTime);
//     return duration.inMinutes;
//   }
//
//   static List<DateTime> getDistinctDates(List<Task> tasks) {
//     Set<DateTime> uniqueDates = {};
//
//     for (var task in tasks) {
//       // Extract the date part only, ignoring the time
//       DateTime taskDate = task.date!.toDate();
//       uniqueDates.add(taskDate);
//     }
//     return uniqueDates.toList();
//   }
//
//   static List<TimePlannerTitle> getHeaderList(List<Task> tasks){
//     List<DateTime> dates = getDistinctDates(tasks);
//      dates.forEach((date) {
//        headers.add(
//          TimePlannerTitle(
//            date: formatDate(date),
//            title: formatDay(date),
//          ),
//        );
//       }
//      );
//      return headers;
//
//   }
//
//   static int getHeaderIndex(DateTime date){
//     return headers.indexOf();
//   }
//
//  static  List<TimePlannerTask> provideTimePlanner(List<Task> tasks) {
//
//     List<TimePlannerTask> timePlannerList = [];
//     tasks.forEach((task) {
//       timePlannerList.add(
//           TimePlannerTask(
//             minutesDuration: calculateDuration(
//                 task.startHour!.toDate(), task.endHour!.toDate()),
//             dateTime: TimePlannerDateTime(
//                 day:  getHeaderIndex(task!.date!.toDate()),
//                 hour: int.parse(formatHour(task.startHour!.toDate())),
//                 minutes: 30),
//             daysDuration: 1,
//             color: TaskColorProvider.getTaskColor(task!.color!),
//             child: Text(
//               task.title!,
//               style: TextStyle(color: Colors.grey[350], fontSize: 12),
//             ),
//           )
//       );
//     });
//     return timePlannerList;
//   }
//
// }
//
