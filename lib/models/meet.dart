import 'package:flutter/material.dart';

class Meet {
  final int id;
  final String eventName;
  final String organizer;
  final String location;
  final String office;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  final String attendees;
  bool isActive;
  bool isCheckedIn;
  // final bool isView;

  Meet({
    required this.id,
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
    // required this.isView,
  });

  // void checkIn() {
  //   isCheckedIn = true;
  //   notifyListeners();
  // }

  // void active() {
  //   // if (startTime.isBefore(DateTime.now())) {
  //   isActive = true;
  //   // }
  //   notifyListeners();
  // }
}
