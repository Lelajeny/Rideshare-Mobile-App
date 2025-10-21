import 'package:flutter/material.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';


class enable_location extends StatefulWidget {
  const enable_location({super.key});

  @override
  State<enable_location> createState() => _enable_locationState();
}

class _enable_locationState extends State<enable_location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/map.png', 
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay for better readability
          Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),



           // Center card
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Location icon
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade50,
                    ),
                    child: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Title
                  const Text(
                    "Enable your location",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  const Text(
                    "Choose your location to start find the request around you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 24),

                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondprimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        
                      },
                      child: const Text(
                        "Use my location",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                 
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: const Text(
                      "Skip for now",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}