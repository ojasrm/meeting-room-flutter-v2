import 'package:booking_room_v2/widgets/meeting_list.dart';

import './models/meet.dart';
import 'package:slide_to_act/slide_to_act.dart';

import './widgets/book_page.dart';
import './widgets/sso.dart';
import './widgets/view_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './widgets/login.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [ViewPage(), BookPage()];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // final List<Meet> meets = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Color.fromARGB(255, 185, 245, 251),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 158, 158, 158),
            icon: Icon(Icons.meeting_room),
            label: 'Meeting room',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 158, 158, 158),
            icon: Icon(Icons.add_card),
            label: 'Booking',
          ),
        ],
      ),
    );
    // return ViewPage();
    // return BookPage();
  }
}
