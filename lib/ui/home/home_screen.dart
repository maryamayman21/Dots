
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/app_auth_provider.dart';
import 'package:todoapp/ui/home/settings_tab/settings_tab.dart';
import 'package:todoapp/ui/home/tasks_tab/tasks_tab.dart';
import 'package:todoapp/utils/dialog_utils.dart';


import '../../core/app_router.dart';
import '../widgets/task_widgets/addTask_widget.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<Widget> tabs = [const TasksTab(), const SettingsTab()];

 int selectedTab = 0;

 void onTap(index){
   setState(() {
     selectedTab= index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      appBar: AppBar(
        
        toolbarHeight: 90,
         centerTitle: true,
        title:  Text(
          'TODs',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(onPressed: (){
              Navigator.pushNamed(context, AppRouter.scheduleRoute);
            }, icon: const Icon(Icons.calendar_month_rounded))),
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(onPressed: (){
                DialogUtils.showMessageDialog(context: context, message:'Are you sure you want to sign out?',
                    posActionTitle:'Confirm', posAction: (){
                    logout();
                    Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
                    }, negActionTitle: 'Cancel' );
                
              }, icon: const Icon(Icons.logout_outlined)))
        ],

    ),
     floatingActionButton: FloatingActionButton(

       shape: const StadiumBorder(
       side: BorderSide( color: Colors.white, width: 3)
       ),
        backgroundColor: Colors.blueAccent,
       //
      onPressed: (){
        showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddTaskWidget())));


      },


       child: const Icon(Icons.add, color: Colors.white),
     ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      notchMargin: 20,
      shape: const CircularNotchedRectangle(),
      child: BottomNavigationBar(

        currentIndex: selectedTab,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    ),
     body:tabs[selectedTab] ,
    );


  }

  void logout(){
   var authProvider = Provider.of<AppAuthProvider>(context, listen: false);
   authProvider.signout();
  }
}

