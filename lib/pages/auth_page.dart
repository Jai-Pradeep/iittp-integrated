import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iittp_integrated/pages/home.dart';
import 'package:iittp_integrated/pages/login_student.dart';
import 'package:iittp_integrated/main.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return HomePage();
            }
            else{
              return LoginPage();
            }
          }
      ),
    );
  }
}
