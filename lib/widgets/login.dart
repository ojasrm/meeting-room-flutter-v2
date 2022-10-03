import './settings.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/images/login.gif',
                scale: 2,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 0,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'User Name',
                          ),
                          controller: userNameController,
                        ),
                        TextField(
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(labelText: 'Password'),
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => {
                                Navigator.of(context).pop(),
                                Navigator.of(context)
                                    .pushNamed(Settings.routeName),
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute<void>(
                                //     builder: (BuildContext context) {
                                //       return Settings();
                                //     },
                                //   ),
                                // ),
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                // minimumSize: Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerRight,
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
