import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../database/model/user.dart';
import '../database/user_dao.dart';

class AppAuthProvider extends ChangeNotifier{

  AppUser? databaseUser;

  User? firebaseAuthUser;

 Future<void> register({ required String email, required String password,required String fullName, required String userName})async{
    var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
     email:email,
     password: password
   );

     await  UserDao.addUser(AppUser(
        id: credential.user?.uid,
        userEmail:email,
        fullName: fullName,
        userName: userName
    ));
 }
 Future<void> login(String email, String password)async {
   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password
   );
   databaseUser = await UserDao.getUser(credential.user!.uid);
   firebaseAuthUser = credential.user;
   notifyListeners();
 }
 void signout(){
    databaseUser = null;
   FirebaseAuth.instance.signOut();
    notifyListeners();
 }

bool isLoggedBefore(){
   return FirebaseAuth.instance.currentUser != null;


}

 Future<void> retrieveUserFromDatabase()async{
   firebaseAuthUser  = FirebaseAuth.instance.currentUser;
   databaseUser = await UserDao.getUser(firebaseAuthUser!.uid);

 }


}