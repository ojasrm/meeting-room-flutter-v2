import './meet_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/meet.dart';

class MeetingList extends StatefulWidget {
  final List<Meet> meets;
  const MeetingList({Key? key, required this.meets}) : super(key: key);

  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  // void _addNewMeeting({
  //   required String eventName,
  //   required String organizer,
  //   required String location,
  //   required String office,
  //   required String room,
  //   required DateTime startTime,
  //   required DateTime endTime,
  //   required int attendees,
  // }) {
  //   final newMeet = Meet(
  //     eventName: eventName,
  //     organizer: organizer,
  //     location: location,
  //     office: office,
  //     room: room,
  //     startTime: startTime,
  //     endTime: endTime,
  //     attendees: attendees,
  //   );
  //   setState(() {
  //     _meets.add(newMeet);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: EdgeInsets.symmetric(
        // horizontal: 20,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: widget.meets.map((meet) {
            return MeetCard(
              eventName: meet.eventName,
              organizer: meet.organizer,
              location: meet.location,
              office: meet.office,
              room: meet.room,
              startTime: meet.startTime,
              endTime: meet.endTime,
              attendees: meet.attendees,
              isActive: meet.isActive,
              isCheckedIn: meet.isCheckedIn,
            );
          }).toList(),
        ),
      ),
    );
  }
}
