import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/app_router.dart';
import 'package:todoapp/database/user_dao.dart';
import 'package:todoapp/provider/app_auth_provider.dart';

import '../../../utils/dialog_utils.dart';
import '../../../utils/email_validation.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/password_validation.dart';
import '../../widgets/app_widgets/custom_button_widget.dart';
import '../../widgets/app_widgets/custom_text_filed.dart';
class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage(getImagePathByName('shape.png')))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Welcome back',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(

                        image: AssetImage(getImagePathByName('undraw_back_to_school_inwc 1.png')))),
              ),

                  CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter your Email',
                      validator: isEmailValide

                  ),
                  CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      hintText: 'Enter your password',
                      isObscure: true,
                      validator: isPasswordValide
                  ),
                  TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: Theme.of(context).primaryColor),
                      )),
                  const SizedBox(
                    height: 32,
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: CustomButtonWidget(
                        text: 'Sign In',
                        onPressed: () {
                          Login(emailController.text, passwordController.text);
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.black)),
                      TextButton(
                          onPressed: () {
                           Navigator.pushReplacementNamed(context, AppRouter.registerRoute);
                          },
                          child: Text(
                            'Sign up',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: Theme.of(context).primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void Login(String userEmail, String userPassword)async{
    var authProvier = Provider.of<AppAuthProvider>(context, listen: false);
    if(formKey.currentState?.validate() == false){
    return;
    }
    try {
      DialogUtils.showLoadingDialog(context: context, message: 'Loading');
         await authProvier.login(userEmail, userPassword);
    DialogUtils.hideDialog(context: context);
    DialogUtils.showMessageDialog(context: context, message: 'User logged successfully', posActionTitle: 'Ok', posAction: (){
       Navigator.pushReplacementNamed(context, AppRouter.homeRoute);
    });

    } on FirebaseAuthException catch (e) {
      if (e.code ==
          'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {

        DialogUtils.hideDialog(context: context);
        DialogUtils.showMessageDialog(context: context, message: 'Incorrect email or password',
            negActionTitle: 'Try again' );
      }
    }


  }
}

