import 'package:flutter/material.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';
import 'package:rideshare_app/Screen/onboarding/onboarding_2.dart'; // Adjust the path as needed

class onboarding_3 extends StatefulWidget {
  const onboarding_3({super.key});

  @override
  State<onboarding_3> createState() => _onboarding_3State();
}

class _onboarding_3State extends State<onboarding_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 300),
                child: TextButton(
                  onPressed: () {
                       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Onboarding2()),
            );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff414141),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Center(child: Image.asset('assets/images/on3.png')),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Book your car',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff414141),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                      child: Text(
                        'Sell houses easily with the help of\n Listenoryx and to make this big\n I am writing more.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffA0A0A0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Circular button
                    GestureDetector(
                      onTap: () {
                                   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Onboarding2()),
            );
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          //color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.background,
                            width: 4,
                          ),
                        ),

                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: const Center(
                            child: Text(
                              'Go',
                              style: TextStyle(color: Color(0xff5A5A5A),
                              fontSize: 18),
                             
                            ),
                          ),
                        ),
                      ),
                    ),

                    //const SizedBox(height: 20),

                    // Bottom indicator (simulating iPhone bar)
                    /**Container(
                margin: const EdgeInsets.only(top: 8),
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),**/
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}