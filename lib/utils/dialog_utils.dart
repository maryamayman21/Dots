import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DialogUtils{
  static void showLoadingDialog({  required BuildContext context, required String message}){
       showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Row(
              children: [
                Text(message,
                style: TextStyle(
                  fontSize: 18, color: Colors.black
                ),
                ),
                SizedBox(
                  width: 4,
                ),
                CircularProgressIndicator()
              ],
            ),
          );

       });

  }

  static void hideDialog({required BuildContext context}){
     Navigator.pop(context);

  }

  static void showMessageDialog({  required BuildContext context, required String message, String? posActionTitle, String? negActionTitle, VoidCallback? posAction,  VoidCallback? negAction}){



      List<Widget> actions= [];
      if(posActionTitle != null){
        actions.add(TextButton(onPressed: (){
          Navigator.pop(context);
          posAction?.call();
        }, child: Text(posActionTitle?? '')));
      }
      if(negActionTitle != null){
        actions.add(TextButton(onPressed: (){
          Navigator.pop(context);
          negAction?.call();
        }, child: Text(negActionTitle?? '')));
      }


    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Row(
          children: [
            Text(message,
              style: const TextStyle(
                  fontSize: 18, color: Colors.black
              ),
            ),
          ],
        ),
        actions: actions
      );

    });

  }



}