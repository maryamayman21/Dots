import 'package:flutter/material.dart';
class CustomTaskField extends StatelessWidget {
  const CustomTaskField({super.key, this.maxLines, required this.hintText, required this.taskController, this.validator});
  final int? maxLines;
  final String hintText;
  final TextEditingController taskController ;
   final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: TextFormField(
        controller: taskController,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText:  hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

