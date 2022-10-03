import './book_page.dart';
import 'package:flutter/material.dart';

class SSO extends StatefulWidget {
  const SSO({Key? key}) : super(key: key);

  @override
  State<SSO> createState() => _LoginState();
}

class _LoginState extends State<SSO> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(83, 158, 158, 158),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(width: 1.0, color: Colors.white),
                      ),
                      icon: Image.asset(
                        'assets/images/google.gif',
                        scale: 5,
                      ),
                      label: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.of(context).pop(),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
