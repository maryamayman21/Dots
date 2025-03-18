import 'package:flutter/material.dart';
class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(18),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              buildSelectedItemTheme(context,'Light'),
          const SizedBox(height: 8,),
           buildUnselectedItemTheme(context, 'Dark')
        ],
      ),
    );
  }
  Widget buildSelectedItemTheme(context,String selectedTheme){
   return Row(
     children: [
       Expanded(child: Text(selectedTheme,
         style: Theme.of(context).textTheme.labelMedium,
       )),
       Icon(Icons.check, size: 32, color: Theme.of(context).primaryColor,)
     ],
   );
  }
  Widget buildUnselectedItemTheme(context, String unselectedtheme){
      return  Text(unselectedtheme,
        style: Theme.of(context).textTheme.bodyLarge,
      );
  }
}
