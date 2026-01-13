import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:rideshare_app/Screen/authentication/forgotpassword.dart';
import 'package:rideshare_app/Screen/authentication/send_verification.dart';
import 'package:rideshare_app/Screen/authentication/signup.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  String phoneNumber = "";
class _LoginState extends State<Login> {
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
              Text('Sign in with your email or phone number', 
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
              SizedBox(height: 16),

              // password field
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(onPressed: () {},
                   icon: Icon(Icons.visibility_off)),
                  ),
                  obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),

              Container(
                margin: EdgeInsets.only(left: 195,top: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SendVerification());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.secondprimary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

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
                    "Log In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
    SizedBox(height: 20,),

              // OR divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),

              // Social buttons
              _buildSocialButton(
                icon: Icons.mail_outline,
                text: "Sign up with Gmail",
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.facebook,
                text: "Sign up with Facebook",
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.apple,
                text: "Sign up with Apple",
              ),
              const SizedBox(height: 18),

              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text("Don't have an account? "),
                  TextButton(
                onPressed: () {
                  Get.to(() => Signup());
                },
                child: Text(
                    "Sign up",
                    style: TextStyle(color: AppColors.secondprimary),
                  ),
                ),
                ],
              ),
              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }
}


  // 🔁 Reusable Social Button Widget
  Widget _buildSocialButton({required IconData icon, required String text}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
        label: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

