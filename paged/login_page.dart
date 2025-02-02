import 'package:flutter/material.dart';
import 'package:greengem/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF7E1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  'assets/gifs/leaf_animation.gif',
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "GreenGem",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
                textAlign: TextAlign.center,
              ),

              Text(
                "The Complete Green Support System",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Color(0xFF4CAF50),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: MyTextField(
                  controller: emailController,
                  hinttext: "Email",
                  obscureText: false,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: MyTextField(
                  controller: passwordController,
                  hinttext: "Password",
                  obscureText: true,
                ),
              ),

              const SizedBox(height: 35),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF66BB6A),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please enter both email and password.'),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }

                    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please enter a valid email address.'),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }

                   Navigator.pushNamed(context, '/menu');

                  },
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0xFF81C784),
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}    
