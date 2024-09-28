import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _mockUsername = 'user';
  final _mockPassword = 'password';

  void _login() {
    if (_usernameController.text == _mockUsername &&
        _passwordController.text == _mockPassword) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  void _continueAsGuest() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[700],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[700]!, Colors.green[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Welcome to GreenUp',
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextButton(
                      onPressed: _continueAsGuest,
                      child: Text('Continue as Guest'),
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
