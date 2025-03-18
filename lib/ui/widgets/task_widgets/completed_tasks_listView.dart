import 'package:flutter/material.dart';

import '../../../database/model/task.dart';
import 'completed_task_widget.dart';

class CompletedTasksListview extends StatelessWidget {
   const CompletedTasksListview({super.key, required this.tasks});
 final List<Task> tasks;
   @override
   Widget build(BuildContext context) {
     return SliverList(

       delegate: SliverChildBuilderDelegate(

             (context, index) {
           return ShaderMask(
             shaderCallback: (Rect bounds) {
               return const LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Colors.white, Colors.transparent],
                 stops: [0.8, 1.0], // Adjust for a more prominent fading effect
               ).createShader(bounds);
             },
             blendMode: BlendMode.dstIn,
             child: CompletedTaskWidget(task: tasks[index],),
           );
         },
         childCount: tasks.length,
       ),
     );

   }
 }
