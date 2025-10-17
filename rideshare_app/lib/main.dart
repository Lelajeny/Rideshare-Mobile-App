import 'package:flutter/material.dart';
import 'package:rideshare_app/Screen/onboarding/01_Onboarding.dart';

import 'Screen/onboarding/onboarding_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const Onboarding_1(),

      
    );
  }
}

