import 'package:flutter/material.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';

class SendVerification extends StatefulWidget {
  const SendVerification({super.key});

  @override
  State<SendVerification> createState() => _SendVerificationState();
}
final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  String phoneNumber = "";

class _SendVerificationState extends State<SendVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
       // backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.black87, size: 18),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 10),
              Text('Verifivation email or phone number', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,),),


                SizedBox(height: 24),

              // Email field
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email or Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
           SizedBox(height: 300,),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Phone number: $phoneNumber");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondprimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
    SizedBox(height: 20,),
              ],
              ),
              ),
              ),
    );
  }
}