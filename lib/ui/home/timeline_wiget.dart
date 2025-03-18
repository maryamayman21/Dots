// import 'package:flutter/material.dart';
// import 'package:time_planner/time_planner.dart';
//
// import '../../database/model/task.dart';
// import '../../utils/time_planner_provider.dart';
// class TimelineWiget extends StatelessWidget {
//   const TimelineWiget({super.key, required this.tasks});
//    final List<Task> tasks;
//   @override
//   Widget build(BuildContext context) {
//     return TimePlanner(
//       style: TimePlannerStyle(
//         // backgroundColor: Theme.of(context).primaryColor,
//
//
//       ),
//       // time will be start at this hour on table
//       startHour: 6,
//       // time will be end at this hour on table
//       endHour: 23,
//       // each header is a column and a day
//       headers:  TimePlannerProvider.getHeaderList(tasks),
//       // List of task will be show on the time planner
//       tasks: TimePlannerProvider.provideTimePlanner(tasks),
//     );
//   }
// }
