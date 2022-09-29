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

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // final List<Meet> meets = [
  //   Meet(
  //     eventName: 'Client Meet',
  //     organizer: 'Ojas Mahajan',
  //     location: 'Pune',
  //     office: 'Pune 1',
  //     room: 'Conference room',
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now().add(Duration(minutes: 30)),
  //     attendees: '20',
  //     isActive: true,
  //     isCheckedIn: false,
  //   ),
  //   Meet(
  //     eventName: 'Sync Meet',
  //     organizer: 'Ojas Mahajan',
  //     location: 'Mumbai',
  //     office: 'Mumbai 1',
  //     room: 'Conference room',
  //     startTime: DateTime.now().add(Duration(minutes: 60)),
  //     endTime: DateTime.now().add(Duration(minutes: 90)),
  //     attendees: '15',
  //     isActive: false,
  //     isCheckedIn: false,
  //   ),
  //   Meet(
  //     eventName: 'All hands Meet',
  //     organizer: 'Ojas Mahajan',
  //     location: 'Pune',
  //     office: 'Pune 1',
  //     room: 'Meeting room',
  //     startTime: DateTime.now().add(Duration(minutes: 120)),
  //     endTime: DateTime.now().add(Duration(minutes: 150)),
  //     attendees: '15',
  //     isActive: false,
  //     isCheckedIn: false,
  //   ),
  //   Meet(
  //     eventName: 'Project kickoff',
  //     organizer: 'Ojas Mahajan',
  //     location: 'Mumbai',
  //     office: 'Mumbai 2',
  //     room: 'Conference room',
  //     startTime: DateTime.now().add(Duration(minutes: 180)),
  //     endTime: DateTime.now().add(Duration(minutes: 210)),
  //     attendees: '15',
  //     isActive: false,
  //     isCheckedIn: false,
  //   ),
  //   Meet(
  //     eventName: 'Event',
  //     organizer: 'Ojas Mahajan',
  //     location: 'Pune',
  //     office: 'Pune 1',
  //     room: 'Gurukul',
  //     startTime: DateTime.now().add(Duration(minutes: 240)),
  //     endTime: DateTime.now().add(Duration(minutes: 270)),
  //     attendees: '15',
  //     isActive: false,
  //     isCheckedIn: false,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return ViewPage();
    // return BookPage();
  }
}
