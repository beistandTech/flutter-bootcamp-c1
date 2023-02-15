import 'package:assignment/home.dart';
import 'package:assignment/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'MAIN LOGIN SCREEN',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 30,
              ),

              //textform field

              TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    label: Text('Email')),
              ),

              const SizedBox(
                height: 30,
              ),

              //textform field

              TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    label: Text('Password')),
              ),

              const SizedBox(
                height: 40,
              ),

              //log in button

              InkWell(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                    (route) => false),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              //sign up button

              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUP(),
                )),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
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
