import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screen/bookmark/bookmark.dart';
import 'package:weatherapp/screen/home/provider/home_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
  }


  @override
  Widget build(BuildContext context) {
    providerW=context.watch<HomeProvider>();
    providerR=context.read<HomeProvider>();
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(
          top: 30,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        decoration:  BoxDecoration(
          gradient: providerW!.themeMode==true?LinearGradient(
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
            colors: [
              Color(0xff97ABFF),
              Color(0xff123597),
            ],
          ):LinearGradient(
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
            colors: [
              Colors.black,
              Color(0xff123597),
            ],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/pngwing.com (1).png",
              height: 300,
              width: 300,
            ),
            Text("Weather Forecast",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text(
              "Weather forecast app provides detailed local forecast & weather forecast world wide, the app provides the current temperature in Celsius and Fahrenheit, sunrise and sunset time according to city time zone.",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
