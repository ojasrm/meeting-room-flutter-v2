import 'package:flutter/material.dart';

class Meet {
  final String eventName;
  final String organizer;
  final String location;
  final String office;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  final String attendees;
  final bool isActive;
  final bool isCheckedIn;

  Meet({
    required this.eventName,
    required this.organizer,
    required this.location,
    required this.office,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.attendees,
    required this.isActive,
    required this.isCheckedIn,
  });
}
