
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/database/tasks_dao.dart';
import 'package:todoapp/provider/app_auth_provider.dart';
import 'package:todoapp/provider/app_auth_provider.dart';
import '../../../core/app_router.dart';
import '../../widgets/task_widgets/completed_tasks_listView.dart';
import '../../widgets/task_widgets/onProgress_listview.dart';
import '../../widgets/task_widgets/title_widget.dart';


class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [


         Expanded(
       child: CustomScrollView(
         physics: const BouncingScrollPhysics(),
       slivers: <Widget>[
         SliverToBoxAdapter(
           child:  Text('Welcome, ${Provider.of<AppAuthProvider>(context).databaseUser!.fullName ?? 'NULL'}',
             style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                 fontSize: 25
             ),

           ),
         ),
         SliverToBoxAdapter(
           child: TitleWidget(title: 'All Tasks',onPressed: (){
             Navigator.pushNamed(context, AppRouter.onProgressRoute);
           },),
         ),
      // const SliverToBoxAdapter(child: OnprogressListview(isHorizontal: true,)),
         const SliverToBoxAdapter(child: SizedBox(height: 16,)),


             StreamBuilder(stream: TasksDao.getAllTaskStreams(Provider.of<AppAuthProvider>(context).databaseUser!.id! ) ,
               builder: (context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.waiting){
                   return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));

                 }
                 if( snapshot.hasError){
                   return SliverToBoxAdapter(child: Center(child: Text(snapshot.error.toString(),  style: TextStyle(
                       color: Colors.black
                   ),),));
                 }
                 var tasks;
                 if (snapshot.hasData) {
                    tasks = snapshot.data ?? [];
                 }
                 if (tasks.isNotEmpty) {
                   return CompletedTasksListview(tasks: tasks);
                 } else {
                   return SliverToBoxAdapter(
                     child: Center(child: Text('No tasks yet')),
                   );
                 }

               },
                ),
         const SliverToBoxAdapter(child: SizedBox(height: 32,)),
        ],
        ),
         )
        ]
      ),
    );

  }
}

// ScheduleScreen()
// TimeRangePicker.show(
//    context: context,
//    onSubmitted: (TimeRangeValue value) {
//    print("${value.startTime} - ${value.endTime}");
//    },
//
//    );
//   ElevatedButton(
//   child: Text("OpenPicker"),
//    onPressed: () => TimeRangePicker.show(
//    context: context,  onSubmitted: (TimeRangeValue value) {
//      print("${value.startTime} - ${value.endTime}");
//    },
//    ),
//    )


//bottom sheet
