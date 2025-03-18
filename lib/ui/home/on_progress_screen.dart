import 'package:flutter/material.dart';

import '../widgets/task_widgets/onProgress_listview.dart';
class OnProgressScreen extends StatelessWidget {
  const OnProgressScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On progress tasks',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Colors.black
        ),
        ),
        centerTitle: true,
      ),
     body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
       child: Column(

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
                      const OnprogressListview(isHorizontal: false,)
                   ]
               )
           )
         ],
       ),
     ),
    );
  }
}
