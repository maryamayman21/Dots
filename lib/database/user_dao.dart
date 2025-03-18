import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/user.dart';

class UserDao{

  static CollectionReference<AppUser>getUserCollection(){
     return
       FirebaseFirestore.instance.collection('users').withConverter(
           fromFirestore: (snapshot, options) => AppUser.fromFireStore(snapshot.data()),
           toFirestore: (user, options) => user.toFireStore());

   }

  static Future<void> addUser(AppUser user){
     var userDoc = getUserCollection();
     var doc = userDoc.doc(user.id);
      return doc.set(user);

  }

  static Future<AppUser?> getUser(String uid)async{
     var userDoc = getUserCollection();
     var doc = userDoc.doc(uid);
     var docSnapshot  = await doc.get();
     return docSnapshot.data();
  }


}