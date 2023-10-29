import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/tasks.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class AuthVerify extends StatelessWidget {
  const AuthVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: "734509898196-qi5qbfkrkde4vhms5achrbh37f13hcji.apps.googleusercontent.com"),
            ],
            
           subtitleBuilder: (context, action) {
              
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: action == AuthAction.signIn
                   ? const Text('Welcome to FlutterFire, please sign in!')
                   : const Text('Welcome to Flutterfire, please sign up!'),
             );
           },
           footerBuilder: (context, action) {
             return const Padding(
               padding: EdgeInsets.only(top: 16),
               child: Text(
                 'By signing in, you agree to our terms and conditions.',
                 style: TextStyle(color: Colors.grey),
               ),
             );
           },
           
         );
       
          
        } else {
          // You need to return a Widget here when the condition is false.
          return const Tasks();
        }
      },
    );
  }
}
