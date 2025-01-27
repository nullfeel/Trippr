import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // White background
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF), // White background
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xFF000000), // Black icon color
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Replace the image with an icon or other visual element
            const Icon(Icons.lock, size: 64.0, color: Color(0xFF000000)), // Black icon color

            const SizedBox(height: 24.0),
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000), // Black text color
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Reset your password and make it strong',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF808080), // Gray text color
              ),
            ),

            // ... rest of the code with similar color adjustments
          ],
        ),
      ),
    );
  }
}