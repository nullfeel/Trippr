import 'package:flutter/material.dart';
import 'package:trippr/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for the image or icon
              Image.asset('assets/img/login_img.png', height: 200),
              const SizedBox(height: 24),
              Text(
                "Sign in",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Please login to continue to your account.",
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Email TextField
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(214, 54, 121, 255))),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(214, 54, 121, 255))),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.forgot);
                  },
                  child: Text("Forgot Password?"),
                ),
              ),
              const SizedBox(height: 16),
              // Sign in Button
              ElevatedButton(
                onPressed: () {
                  _signIn(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text("Sign in"),
              ),
              const SizedBox(height: 16),
              Text("or", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              // Google Sign in Button
              OutlinedButton.icon(
                onPressed: () {
                  // Handle Google Sign in action
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                icon: Icon(Icons.account_circle),
                label: Text("Sign in with Google"),
              ),
              const SizedBox(height: 16),
              // Create Account link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Need an account?"),
                  TextButton(
                    onPressed: () {
                       Navigator.pushReplacementNamed(context, AppRoutes.signUp);
                    },
                    child: Text("Create one"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
