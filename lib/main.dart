import 'package:flutter/material.dart';

import 'screens/signup_screen.dart';

void main() {
  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinic App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B84D7),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 65),

              // App Icon
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1EAFB),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.medical_services_outlined,
                    size: 36,
                    color: Color(0xFF527FD4),
                  ),
                ),
              ),

              const SizedBox(height: 42),

              // Heading
              const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172033),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Login to manage your clinic',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF7A8497),
                ),
              ),

              const SizedBox(height: 40),

              // Mobile Number Label
              const Text(
                'Mobile Number',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF263247),
                ),
              ),

              const SizedBox(height: 10),

              // Mobile Number Field
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter mobile number',
                  hintStyle: const TextStyle(
                    color: Color(0xFFA5ADBA),
                  ),
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: Color(0xFF7D8798),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF5B84D7),
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Send OTP Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B84D7),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Sign Up
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'New doctor? ',
                      style: TextStyle(
                        color: Color(0xFF7A8497),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Create an account',
                          style: TextStyle(
                            color: Color(0xFF527FD4),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}