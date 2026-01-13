import 'package:flutter/material.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override

  final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: Row(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff414141),
                size: 18,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff414141),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [

         Container(
          
          margin: EdgeInsets.only(left: 20, right: 130),
           child: Text("Sign up with your email or \nphone number ",
           // textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xff414141),
            ),
           ),
         ),

       SizedBox(height: 20),

         Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          width: 362,
           child: TextField(
            decoration: InputDecoration(
              hintText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
           ),
         ),


                SizedBox(height: 10),

         Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          width: 362,
           child: TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
           ),
         ),


                SizedBox(height: 20),

         Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 60,
          width: 362,
           child: TextField(
            decoration: InputDecoration(
              hintText: 'Name',
              prefixIcon: Icon(Icons.flag),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
           ),
         )
          ],
          
        ),
      ),
    );
  }
}
