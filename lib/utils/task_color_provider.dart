import 'dart:ui';

import '../core/constants.dart';
class TaskColorProvider{
 static Color getTaskColor(int index){

    return taskColors[index];

  }
  static final List<Color> taskColors = [
    MyColors.babyBlue,
    MyColors.softPink,
    MyColors.lemonYellow,
    MyColors.lightGreen,
    MyColors.darkPurple,
    MyColors.peach,
    MyColors.lavander,
  ];

}
