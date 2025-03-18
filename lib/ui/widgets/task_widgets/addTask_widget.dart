import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/constants.dart';
import 'package:todoapp/database/tasks_dao.dart';
import 'package:todoapp/provider/app_auth_provider.dart';
import 'package:todoapp/ui/widgets/task_widgets/task_color_widget.dart';
import 'package:todoapp/ui/widgets/task_widgets/time_picker.dart';
import 'package:todoapp/utils/dat_formatter.dart';
import 'package:todoapp/utils/date_formatter_util.dart';
import 'package:todoapp/utils/dialog_utils.dart';
import 'package:todoapp/utils/time_formatter_utils.dart';
import '../../../database/model/task.dart';
import '../../../utils/task_color_provider.dart';
import 'custom_button_widget.dart';
import 'custom_task_field.dart';
import 'date_picker_widget.dart';
class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  TextEditingController taskTileController = TextEditingController();
  TextEditingController descriptionTitleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int selectedIndex = 0 ;
  void selectColor(index) {
    setState(() {
      selectedIndex = index;

    });
  }
  DateTime selectedDate = DateTime.now();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('New Task ToDo',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Task Title',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
             CustomTaskField(
                 validator: (input){
                   if(input == null   || input.trim().isEmpty) {
                     return 'Enter task name';
                   }
                   return null;
                 },
              taskController: taskTileController,
              hintText: 'Add Task Name',
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Description',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(
              height: 16,
            ),
             CustomTaskField(
               validator: (input){
                 if(input == null   || input.trim().isEmpty) {
                   return 'Enter description';
                 }
                 return null;
               },
               taskController: descriptionTitleController,
              maxLines: 5,
              hintText: 'Enter description here...',
            ),
            const SizedBox(
              height: 16,
            ),

            Text('Date',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: 16,
            ),
           MyDatePicker(
              onChanged: getDate,
             validator:(input){
               if(input == null) {
                 return 'Enter date';
               }
               return null;
             },
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Start Time'),
                Text('End Time'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTimePicker(onChanged: getStartTime,
                validator: (input){
                  if(input == null) {
                    return 'Enter hour';
                  }
                  return null;
                },
                ),
                MyTimePicker(
                  onChanged: getEndTime,
                   validator: (input){
                      if(input == null) {
                        return 'Enter hour';
                      }
                      return null;
                    },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: TaskColorProvider.taskColors.length,
               itemBuilder: (context, index){
                 return   InkWell(
                   onTap: ()=> selectColor(index),
                   child: TaskColorWidget(tasKColor:  TaskColorProvider.taskColors[index], isSelected:  selectedIndex == index,)
                 ) ;
               },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           CustomTaskButtonWidget(text: 'Cancel', buttonColor: Colors.white, textColor: Theme.of(context).primaryColor, onPressed: (){
             Navigator.pop(context);
           },),
           CustomTaskButtonWidget(text: 'Create', buttonColor: Theme.of(context).primaryColor, textColor: Colors.white, onPressed:createTask),

         ],
            )
          ],
        ),
      ),
    );

  }
  void createTask()async{
    var authProv = Provider.of<AppAuthProvider>(context, listen: false);
    if(formKey.currentState!.validate() == false) return;
    DialogUtils.showLoadingDialog(context: context, message: 'Creating task...');
   await  TasksDao.addTask(Task(
       id: authProv.databaseUser!.id! ,
       title: taskTileController.text,
       description: descriptionTitleController.text,
       startHour:Timestamp.fromMillisecondsSinceEpoch(selectedStartDate.millisecondsSinceEpoch),
       endHour: Timestamp.fromMillisecondsSinceEpoch(selectedEndDate.millisecondsSinceEpoch),
       date: Timestamp.fromMillisecondsSinceEpoch(selectedDate.millisecondsSinceEpoch),
       color: selectedIndex,
       isDone: false,
     ), authProv.databaseUser!.id!);
   DialogUtils.hideDialog(context: context);
   DialogUtils.showMessageDialog(context: context, message: 'Task created successfully.',posActionTitle: 'Ok', posAction: (){
     Navigator.pop(context);
   });

  }
  void getStartTime(DateTime? value) {
    if (value != null) {
      selectedStartDate = value!;
    }
  }
  void getEndTime(DateTime? value){
    if(value != null) {
      selectedEndDate = value!;
    }
  }
  void getDate(DateTime? value){
    if(value != null) {
      selectedDate = value!;
      print(selectedDate);


    }


  }

}
