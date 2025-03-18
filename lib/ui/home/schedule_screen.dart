import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';
import 'package:todoapp/ui/home/schedule_builder.dart';

class ScheduleScreen extends StatelessWidget {
   ScheduleScreen({super.key});
  final List<TimePlannerTask> tasks = [
    TimePlannerTask(

      // background color for task
      color: Colors.purple,
      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 2, hour: 14, minutes: 30),
      // Minutes duration of task
      minutesDuration: 120,
      // Days duration of task (use for multi days task)
      daysDuration: 1,
      onTap: () {},
      child: Text(
        'this is a task',
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: AppBar(

          title: Text(
            'Schedule',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.black
            ),
          ),
          centerTitle: true,

      ),
      body:  Column(
        children:[
          Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Container()
             // ScheduleBuilder()
          ),
        ),
    ]
      ) ,
    );

  }
}
