import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
String? id;
String? title;
String? description;
Timestamp? date;
Timestamp? startHour;
Timestamp? endHour;
bool? isDone;
int? color;
 Task({this.id, this.title, this.description, this.date, this.startHour, this.endHour, this.color = 0 , this.isDone = false});

 Map<String , dynamic> toFirestore() {
  return {
   'id': id,
   'title': title,
   'description': description,
   'taskDate': date,
   'startHour': startHour,
   'endHour': endHour,
   'color': color,
   'isDone': isDone
  };
 }

  Task.fromFireStore(  Map<String , dynamic>? data) : this(

   id: data?['id'],
   title: data?['title'],
   description: data?['description'],
   date: data?['taskDate'],
   startHour: data?['startHour'],
   endHour: data?['endHour'],
   color: data?['color'],
   isDone: data?['isDone']
  );




 }





