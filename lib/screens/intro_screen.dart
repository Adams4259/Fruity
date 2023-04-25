import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:soko/screens/home_screen.dart';
import 'package:soko/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "TAMU MARKET",
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "First Online",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Market",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Our market always provide fresh items from the local farmers, let's support local.",
                style: TextStyle(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/bg.png"),
              ),
              const Spacer(),
              SlideAction(
                outerColor: kPrimaryColor,
                sliderButtonIcon: const Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 20,
                  color: kPrimaryColor,
                ),
                text: "SWIPE TO START",
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                onSubmit: () {
                  // delay of 500 milliseconds before next screen push
                  Timer(
                    const Duration(milliseconds: 500),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: "HOW TO SUPPORT",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                TextSpan(
                  text: "LOCAL FARMERS",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
