import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // TODO: Add controller logic for login
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace this with your logo
              Image.asset(
                'lib/resources/logo.png', // Replace with your logo image path
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              // Container to control the width of text fields
              Container(
                width: 300, // Adjust the width as needed
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Container to control the width of text fields
              Container(
                width: 300, // Adjust the width as needed
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Larger Login Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement login functionality
                  // For simplicity, navigate to the dashboard directly
                  Get.toNamed('/dashboard');
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
