import 'package:flutter/material.dart';

import '../widgets/task_widgets/completed_tasks_listView.dart';

class Completedtaskscreen extends StatelessWidget {
  const Completedtaskscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('Completed tasks',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:16, horizontal: 8 ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              Expanded(
                  child: CustomScrollView(
                      slivers:<Widget> [
                SliverToBoxAdapter(
                  child: Row(
                    children:[ Text('(12) Tasks',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight:  FontWeight.bold,
                        color: Colors.black ,
                      ),
                    ),
                  ]
                  )
               ),
               // const CompletedTasksListview()
              ]
              )
              )
          ],
        ),
      ),
    );
  }
}
