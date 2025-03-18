import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/app_auth_provider.dart';
import 'package:todoapp/ui/auth/login/login_screen.dart';
import 'package:todoapp/ui/auth/register/register_screen.dart';
import 'package:todoapp/ui/home/completedTaskScreen.dart';
import 'package:todoapp/ui/home/home_screen.dart';
import 'package:todoapp/ui/home/on_progress_screen.dart';
import 'package:todoapp/ui/home/schedule_screen.dart';
import 'package:todoapp/ui/onboarding/onBoarding.dart';
import 'package:todoapp/ui/splash/splash.dart';
import 'core/app_router.dart';
import 'core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider<AppAuthProvider>(
       create: (context)=> AppAuthProvider() ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.splashRoute,
      onGenerateRoute: (settings) {
        switch(settings.name){
          case AppRouter.homeRoute :
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
          case AppRouter.scheduleRoute :
            return MaterialPageRoute(
              builder: (context) =>  ScheduleScreen(),
            );
          case AppRouter.onProgressRoute :
            return MaterialPageRoute(
              builder: (context) =>  const OnProgressScreen(),
            );
          case AppRouter.completedTasksRoute :
            return MaterialPageRoute(
              builder: (context) =>  const Completedtaskscreen(),
            );
          case AppRouter.registerRoute :
            return MaterialPageRoute(
              builder: (context) =>    RegisterScreen(),
            );
          case AppRouter.onBoardRoute:
            return MaterialPageRoute(
              builder: (context) =>  const  OnboardingScreen(),
            );
          case AppRouter.loginRoute:
            return MaterialPageRoute(
              builder: (context) =>   LoginScreen(),
            );
          case AppRouter.splashRoute:
            return MaterialPageRoute(
              builder: (context) =>  Splash(),
            );
        }

      } ,
    );
  }
}
