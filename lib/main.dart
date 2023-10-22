import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserTheme(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/homePage': (context) => HomePage(),
        },
      ),
    ),
  );
}

class UserTheme extends ChangeNotifier {
  int count;
  Color backgroundColor;

  UserTheme({this.count = 5, this.backgroundColor = Colors.black});

  void incrementCount() {
    count++;
    notifyListeners();
  }

  void changeBackgroundColor(Color bgColor) {
    backgroundColor = bgColor;
    notifyListeners();
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
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
  bool verifier(String username, String password) {
  if (username == 'admin' && password == 'admin') {
    return true;
  } else {
    return false;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
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
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        if (!verifier(username, password)) {
                          handlePressed();
                          Navigator.pushNamed(context, '/homePage'); // Navigate to the HomePage
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userTheme = Provider.of<UserTheme>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: userTheme.backgroundColor,
          child: Center(
            child: Column(
              children: [
                Text(
                  userTheme.count.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {
                    userTheme.incrementCount();
                  },
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    userTheme.changeBackgroundColor(const Color.fromARGB(255, 41, 39, 176));
                  },
                  child: const Text('Change Color'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
