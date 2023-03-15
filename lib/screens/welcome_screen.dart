import 'package:chatori_satori_proper/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatori_satori_proper/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import '/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animationTwo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animationTwo =
        ColorTween(begin: kConstantColourPurple, end: kConstantColourNavy)
            .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstantColourNavy,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: SizedBox(
                      height: animation.value * 85,
                      child: Image.asset(
                        'images/satori png.png',
                      ),
                    ),
                  ),
                ),
                TextLiquidFill(
                  text: 'Chatori',
                  textStyle: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                      wordSpacing: 10,
                      color: kConstantColourPurple),
                  waveColor: kConstantColourWhite,
                  boxHeight: 77,
                  boxWidth: 200,
                  boxBackgroundColor: kConstantColourNavy,
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            RoundedButton(
                colour: kConstantColourPurple,
                title: 'Register',
                onPressed: () {
                  print(
                      '+++ REGISTER BUTTON ON PRESSED TRIGGERED AND PUSHED SCREEN TO REGISTRATION SCREEN ');
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
            RoundedButton(
              colour: kConstantColourPurple,
              onPressed: () {
                print(
                    '+++ LOG IN BUTTON ON PRESSED TRIGGERED AND PUSHED SCREEN TO LOGIN SCREEN ');
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'Log in',
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Follow for more',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 30,
                  color: kConstantColourWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
