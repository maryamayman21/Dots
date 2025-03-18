// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp/ui/home/timeline_wiget.dart';
//
// import '../../database/tasks_dao.dart';
// import '../../provider/app_auth_provider.dart';
// class ScheduleBuilder extends StatelessWidget {
//   const ScheduleBuilder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(stream: TasksDao.getAllTaskStreams(Provider.of<AppAuthProvider>(context).databaseUser!.id! ) ,
//       builder: (context, snapshot) {
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return  Center(child: CircularProgressIndicator());
//
//         }
//         if( snapshot.hasError){
//           return  Center(child: Text(snapshot.error.toString(),  style: TextStyle(
//               color: Colors.black
//           ),),);
//         }
//         var tasks;
//         if (snapshot.hasData) {
//           tasks = snapshot.data ?? [];
//         }
//         if (tasks.isNotEmpty) {
//           return TimelineWiget(tasks: tasks,);
//         } else {
//           return
//            Center(child: Text('No tasks yet')
//           );
//         }
//
//       },
//     );
//   }
// }
