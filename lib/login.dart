import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login();
  @override
  LoginPage createState() {
    return LoginPage();
  }
}
bool verifier(String username, String password) {
  if (username == 'admin' && password == 'admin') {
    return true;
  } else {
    return false;
  }
}
class LoginPage extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  String username = '';
  String password = '';

  Future<String?> handlePressed() {
    String username = usernameController.text;
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Nice!'),
              content: Text('Hello $username'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Thanks!'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Hello world!")),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: SizedBox(
                height: 350,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        if (verifier(username, password)) {
                          handlePressed();
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
