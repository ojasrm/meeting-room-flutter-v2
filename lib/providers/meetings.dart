import '../models/meet.dart';
import 'package:flutter/material.dart';

class Meetings with ChangeNotifier {
  List<Meet> _meetings = [
    Meet(
      id: 1,
      eventName: 'Client Meet',
      organizer: 'Ojas Mahajan',
      location: 'Pune',
      office: 'Pune 1',
      room: 'Conference room',
      startTime: DateTime.now().subtract(Duration(minutes: 3)),
      endTime: DateTime.now().add(Duration(minutes: 30)),
      attendees: '20',
      isActive: true,
      isCheckedIn: false,
    ),
    Meet(
      id: 2,
      eventName: 'Sync Meet',
      organizer: 'Ravi Sharma',
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
      id: 3,
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
      id: 4,
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
      id: 5,
      eventName: 'Event',
      organizer: 'Ravi Sharma',
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

  List<Meet> get meetings {
    return [..._meetings];
  }

  List<Meet> filterByOrganizer(String organizer) {
    return [..._meetings.where((meet) => meet.organizer == organizer)];
  }

  void addMeeting(Meet newMeet) {
    _meetings = [..._meetings.add(newMeet) as List<Meet>];
    notifyListeners();
  }

  void checkIn(int id) {
    print('checked in');
    _meetings.firstWhere((meet) => meet.id == id).isCheckedIn == true;
  }

  void working() {
    print('Working');
  }
}
