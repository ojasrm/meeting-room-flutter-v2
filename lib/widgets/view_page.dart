import 'package:intl/intl.dart';

import '../models/meet.dart';
import './login.dart';

import 'settings.dart';
import 'package:flutter/material.dart';
import './meeting_list.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key? key}) : super(key: key);
  final List<Meet> meets = [
    Meet(
      eventName: 'Client Meet',
      organizer: 'Ojas Mahajan',
      location: 'Pune',
      office: 'Pune 1',
      room: 'Conference room',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 30)),
      attendees: '20',
      isActive: true,
      isCheckedIn: false,
    ),
    Meet(
      eventName: 'Sync Meet',
      organizer: 'Ojas Mahajan',
      location: 'Mumbai',
      office: 'Mumbai 1',
      room: 'Conference room',
      startTime: DateTime.now().add(Duration(minutes: 60)),
      endTime: DateTime.now().add(Duration(minutes: 90)),
      attendees: '15',
      isActive: false,
      isCheckedIn: false,
    ),
    Meet(
      eventName: 'All hands Meet',
      organizer: 'Ojas Mahajan',
      location: 'Pune',
      office: 'Pune 1',
      room: 'Meeting room',
      startTime: DateTime.now().add(Duration(minutes: 120)),
      endTime: DateTime.now().add(Duration(minutes: 150)),
      attendees: '15',
      isActive: false,
      isCheckedIn: false,
    ),
    Meet(
      eventName: 'Project kickoff',
      organizer: 'Ojas Mahajan',
      location: 'Mumbai',
      office: 'Mumbai 2',
      room: 'Conference room',
      startTime: DateTime.now().add(Duration(minutes: 180)),
      endTime: DateTime.now().add(Duration(minutes: 210)),
      attendees: '15',
      isActive: false,
      isCheckedIn: false,
    ),
    Meet(
      eventName: 'Event',
      organizer: 'Ojas Mahajan',
      location: 'Pune',
      office: 'Pune 1',
      room: 'Gurukul',
      startTime: DateTime.now().add(Duration(minutes: 240)),
      endTime: DateTime.now().add(Duration(minutes: 270)),
      attendees: '15',
      isActive: false,
      isCheckedIn: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Meeting Room App',
          style: TextStyle(
              // color: Color.fromARGB(255, 103, 225, 255),
              // fontWeight: FontWeight.w500,
              ),
        ),
        // backgroundColor: Color.fromARGB(183, 116, 116, 116),
        backgroundColor: Color.fromARGB(68, 123, 196, 255),
        // foregroundColor: Color.fromARGB(255, 103, 225, 255),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return Login();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 24, 24, 24),
              Color.fromARGB(146, 0, 3, 104),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat.Hm().format(DateTime.now()),
                  // '10:30',
                  // DateFormat.Hm().format(DateTime.now()),
                  style: TextStyle(
                    color: Color.fromARGB(204, 238, 238, 238),
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conference Room',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pune',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'In use for next 50 min',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            MeetingList(meets: meets),
          ],
        ),
      ),
    );
  }
}
