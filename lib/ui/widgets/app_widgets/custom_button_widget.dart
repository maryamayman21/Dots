import 'package:flutter/material.dart';

import '../../../core/constants.dart';
class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        shape: const RoundedRectangleBorder(

            borderRadius: BorderRadius.all(Radius.circular(5))
        ) ,
        color:MyColors.lightprimary,
        minWidth: double.infinity,
        onPressed: onPressed,
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
          child:  Text(
           text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
