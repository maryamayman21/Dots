import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/app_router.dart';
import 'package:todoapp/provider/app_auth_provider.dart';

import '../../utils/image_utils.dart';
class Splash extends StatelessWidget {
  const Splash({super.key});

  void navigate(BuildContext context)async{

    var authProvider = Provider.of<AppAuthProvider>(context,listen: false);
     if(authProvider.isLoggedBefore()){
      await authProvider.retrieveUserFromDatabase();
       Navigator.pushReplacementNamed(context,AppRouter.homeRoute);
     }
     else {
       Navigator.pushReplacementNamed(context,AppRouter.onBoardRoute);
     }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      navigate(context);
    });
    return Image.asset(getImagePathByName('TODs..png'));
    }

  }

