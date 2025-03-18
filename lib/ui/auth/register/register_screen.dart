import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/app_router.dart';
import 'package:todoapp/database/model/user.dart' as MyUser;
import 'package:todoapp/database/user_dao.dart';
import '../../../database/model/user.dart';
import '../../../provider/app_auth_provider.dart';
import '../../../utils/dialog_utils.dart';
import '../../../utils/email_validation.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/password_validation.dart';
import '../../widgets/app_widgets/custom_button_widget.dart';
import '../../widgets/app_widgets/custom_text_filed.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

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
                    'Welcome to Onboard!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Let\'s help to meet up your tasks.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                       CustomTextField(
                         controller: fullNameController,
                      label: 'Name',
                      keyboardType: TextInputType.name,
                      hintText: 'Enter your Full Name',
                    validator: (input){
                        if(input == null || input.trim().isEmpty){
                            return 'Name cant be empty';
                        }
                        if(input is int ){
                          return 'Name cant be a number';
                        }
                        return null;
                    },
                  ),
                  CustomTextField(
                      controller: userNameController,
                      label: 'User Name',
                      keyboardType: TextInputType.name,
                      hintText: 'Enter your username',
                      validator: (input){
                        if(input == null || input.trim().isEmpty){
                          return 'user name cant be empty';
                        }

                        return null;
                      },

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
                    CustomTextField(
                      controller: confirmPasswordController,
                    label: 'Confirm Password',
                    hintText: ' Confirm password',
                    isObscure: true,
                     validator: (input){
                        if(input!.trim().isEmpty || input == null ){
                          return 'Please enter data';
                        }
                        if(confirmPasswordController.text != passwordController.text){
                          return 'Password is not matched';
                        }
                        return null;
                     }
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 16),
                      child: CustomButtonWidget(
                        text: 'Register',
                        onPressed: () {
                          Register(emailController.text, passwordController.text, fullNameController.text, userNameController.text);
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already has an account?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
                          },
                          child: Text(
                            'Sign In',
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

  void Register(String userEmail, String userPassword, String fullName, String userName)async{
       var authProvider = Provider.of<AppAuthProvider>(context, listen: false);
    if(formKey.currentState?.validate() == false){
      return;
    }
    try {
      DialogUtils.showLoadingDialog(context: context, message: 'Creating account...');
              authProvider.register(email: userEmail, password: userPassword, userName:  userName, fullName: fullName);

      DialogUtils.hideDialog(context: context);
      DialogUtils.showMessageDialog(context: context, message: 'Account created successfully', posActionTitle: 'Ok', posAction: (){
        Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password' || e.code == 'email-already-in-use') {
        DialogUtils.hideDialog(context: context);
        DialogUtils.showMessageDialog(context: context, message: 'This account already exist',
            negActionTitle: 'Ok' );
      }
    }catch(e){
      DialogUtils.hideDialog(context: context);
      DialogUtils.showMessageDialog(context: context, message: 'Something went wrong',
          negActionTitle: 'Ok' );
      print(e.toString());
    }

  }
}
