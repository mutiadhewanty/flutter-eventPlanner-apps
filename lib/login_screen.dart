import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  var baseUrl = "https://b517-103-17-77-3.ngrok-free.app/api";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 22)),
              Center(
                child: Image.asset(
                  "assets/images/login-image.png",
                  height: 184,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Masuk Akun",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email, color: Colors.blue),
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.black26),
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  // controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.blue,
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black26),
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0069CC)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {
                    // print(emailController.text);
                    // print(passwordController.text);
                    // await login();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                // email: emailController.text,
                                )));
                  },
                  child: Text("Masuk"),
                ),
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color(0xFF4D4D4D),
                    width: 120,
                    height: 1,
                  ),
                  Text("Or Login With"),
                  Container(
                    color: const Color(0xFF4D4D4D),
                    width: 120,
                    height: 1,
                  )
                ],
              ),
              Container(
                height: 36,
              ),
              Container(
                height: 36,
                child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png"),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?"),
                  Container(width: 12),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Color(0xFF0069CC)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
