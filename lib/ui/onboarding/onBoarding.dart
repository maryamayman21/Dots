import 'package:flutter/material.dart';
import 'package:todoapp/core/app_router.dart';
import 'package:todoapp/ui/widgets/app_widgets/custom_button_widget.dart';
import '../../core/constants.dart';
import '../../utils/image_utils.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              alignment: Alignment.topLeft,
              image:  AssetImage(
                  getImagePathByName('shape.png')
              )
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(
              flex: 3,
            ),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage(
                          getImagePathByName('undraw_done_checking_re_6vyx 1.png')
                      )
                  )
              ),
            ),
            const Spacer(
              flex: 1,
            ),

            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get things with TODs',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20
                    ),
                  ),
                  Text('Lorem ipsum dolor sit amet consectetur. Eget sit nec et euismod. Consequat urna quam felis interdum quisque. Malesuada adipiscing tristique ut eget sed.',
                    maxLines: 6,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 16 ),
              child: CustomButtonWidget(text: 'Get Started', onPressed: () {
                Navigator.pushNamed(context, AppRouter.registerRoute);
              },)
            )
          ],
        ),
      ),
    );
  }
}
