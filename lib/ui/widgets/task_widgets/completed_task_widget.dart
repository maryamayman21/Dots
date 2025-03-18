import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/database/tasks_dao.dart';
import 'package:todoapp/provider/app_auth_provider.dart';
import 'package:todoapp/utils/date_formatter_util.dart';
import 'package:todoapp/utils/task_color_provider.dart';

import '../../../database/model/task.dart';
class CompletedTaskWidget extends StatefulWidget {
  const CompletedTaskWidget({super.key, required this.task});
  final Task task;

  @override
  State<CompletedTaskWidget> createState() => _CompletedTaskWidgetState();
}

class _CompletedTaskWidgetState extends State<CompletedTaskWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children:  [
            SlidableAction(
              onPressed: (context){
                deleteTask();
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context){},
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),


        child: Card(

          elevation: 5, // Gives the Card a shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners for the Card
          ),
          child: Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: TaskColorProvider.getTaskColor(widget.task!.color!),
                  width: 8.0,         // Bottom border width
                ),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.task.title ?? '',
                      style: isChecked?  Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        decoration:  TextDecoration.lineThrough
                      ) : Theme.of(context).textTheme.bodyLarge
                    ),
                   InkWell(
                     onTap: (){
                       setState(() {
                         isChecked = !isChecked;
                       });
                     },
                     child: Container(
                       decoration: isChecked? const BoxDecoration(
                        color:   Colors.blueAccent,
                         borderRadius: BorderRadius.all(Radius.circular(50))
                       ) :    BoxDecoration(
                           color:   Colors.white,
                           borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Colors.grey)

                       ),
                       height: 30,
                       width: 30,
                       child: isChecked?  const Icon(Icons.done_outlined,
                       color: Colors.white,
                       ) : SizedBox()
                     ),
                   )
                  ],
                ),
                Text(
                  widget.task.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 10,
                  indent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[ Text(
                  formatDate(widget.task.date!.toDate())  ?? 'null',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      decoration:BoxDecoration(
                        color: TaskColorProvider.getTaskColor(widget.task!.color!),
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                      ),
                      height: 10,
                      width: 10,
                    ),
            ]
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
   void deleteTask() async{
     var auth = Provider.of<AppAuthProvider>(context, listen: false);
     try{
       await TasksDao.deleteTask(auth.databaseUser!.id!, widget.task!.id!);
     }catch(e){
       print(e.toString());
     }

    }

}
