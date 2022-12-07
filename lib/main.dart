import './widgets/meeting_list.dart';

import './models/meet.dart';
import 'package:slide_to_act/slide_to_act.dart';

import './providers/meetings.dart';
import './widgets/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/book_page.dart';
import './widgets/sso.dart';
import './widgets/view_page.dart';
import 'package:intl/intl.dart';

import './widgets/login.dart';
import './widgets/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Room Flutter',
      // theme: ThemeData(
      //   colorSchemeSeed: Color.fromARGB(255, 68, 0, 255),
      //   useMaterial3: true,
      // ),
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        // accentColor: Colors.green,
        fontFamily: 'Google',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       headline6: TextStyle(
        //         fontFamily: 'Google',
        //         // fontSize: 20,
        //         // fontWeight: FontWeight.bold,
        //       ),
        //     ),
        // appBarTheme: AppBarTheme(
        //   titleTextStyle: TextStyle(
        //     fontFamily: 'OpenSans',
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext ctx) => Meetings(),
        child: HomePage(),
      ),
      routes: {
        ViewPage.routeName: (ctx) => ViewPage(),
        BookPage.routeName: (ctx) => BookPage(),
        SSO.routeName: (ctx) => SSO(),
        Login.routeName: (ctx) => Login(),
        Settings.routeName: (ctx) => Settings(),
      },
    );
  }
}
