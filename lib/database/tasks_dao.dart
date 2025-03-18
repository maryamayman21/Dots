import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/database/user_dao.dart';

import 'model/task.dart';

class TasksDao{

 static CollectionReference<Task> getTaskCollection(String uid){

   var userCollection = UserDao.getUserCollection();
   var userDoc = userCollection.doc(uid);
   return userDoc.collection('Tasks').withConverter(
     fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()),
     toFirestore: (task, options) => task.toFirestore(),);

 }
static Future<void> addTask(Task task, String uid){
  var taskCollection = getTaskCollection(uid);
   return  taskCollection.add(task);

}

 static Stream<QuerySnapshot<Task>> getAllTaskStream(String uid)async*{
   var taskCollection = getTaskCollection(uid).orderBy('taskDate');
   var stream = await taskCollection.snapshots();
    yield* stream;

 }
 static Stream<List<Task>> getAllTaskStreams(String uid) {
   var taskCollection = getTaskCollection(uid).orderBy('taskDate');
   return taskCollection.snapshots().map((snapshot) {
     return snapshot.docs.map((doc) {
       var task = doc.data();
       task.id = doc.id;
       return task;
     }).toList();
   });
 }


 static Future<void> deleteTask(String uid, String taskId){
  var taskCollection = getTaskCollection(uid);
   return taskCollection.doc(taskId).delete();

 }
}