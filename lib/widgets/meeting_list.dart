import '../providers/meetings.dart';
import 'package:provider/provider.dart';

import './meet_card.dart';
import 'package:flutter/material.dart';

import '../models/meet.dart';

class MeetingList extends StatefulWidget {
  final bool isView;
  const MeetingList({Key? key, required this.isView}) : super(key: key);

  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  @override
  Widget build(BuildContext context) {
    final meetingsData = Provider.of<Meetings>(context);
    final meetings = meetingsData.meetings;
    final filteredByOrganizer = meetingsData.filterByOrganizer('Ojas Mahajan');
    return Container(
      height: 480,
      padding: EdgeInsets.symmetric(
        // horizontal: 20,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: widget.isView
              ? meetings.map((meet) {
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
                    isView: widget.isView,
                  );
                }).toList()
              : filteredByOrganizer.map((meet) {
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
                    isView: widget.isView,
                  );
                }).toList(),
        ),
      ),
    );
  }
}
