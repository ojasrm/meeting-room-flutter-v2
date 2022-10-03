import 'package:booking_room_v2/widgets/sso.dart';
import 'package:intl/intl.dart';

import '../models/meet.dart';
import './add_new_meeting_modal.dart';
import './meeting_list.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
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
      isActive: false,
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

  void showCalendar() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 228, 249, 255),
              ),
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                    // defaultTextStyle: TextStyle()
                    // selectedDecoration: BoxDecoration(
                    //   color: Colors.red,
                    //   shape: BoxShape.rectangle,
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  // titleTextStyle: TextStyle(
                  //   color: Color.fromARGB(204, 255, 255, 255),
                  // ),
                  // leftChevronIcon: Icon(
                  //   Icons.chevron_left,
                  //   color: Color.fromARGB(204, 255, 255, 255),
                  // ),
                  // rightChevronIcon: Icon(
                  //   Icons.chevron_right,
                  //   color: Color.fromARGB(204, 255, 255, 255),
                  // ),
                ),
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                  Navigator.of(context).pop;
                },
              ),
            ),
          );
        });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDay = date;
      });
    });
  }

  void addNewMeet({
    required String eventName,
    required String organizer,
    required String location,
    required String office,
    required String room,
    required DateTime startTime,
    required DateTime endTime,
    required String attendees,
    required bool isActive,
    required bool isCheckedIn,
  }) {
    final newMeet = Meet(
      eventName: eventName,
      organizer: organizer,
      location: location,
      office: office,
      room: room,
      startTime: startTime,
      endTime: endTime,
      attendees: attendees,
      isActive: isActive,
      isCheckedIn: isCheckedIn,
    );
    setState(() {
      meets.add(newMeet);
    });
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  void addNewMeeting(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 228, 249, 255),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewMeetingModal(addNewMeet: addNewMeet),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      // backgroundColor: Gradient(colors: ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Meeting Room App',
          // style: TextStyle(
          //     // color: Color.fromARGB(255, 103, 225, 255),
          //     // fontWeight: FontWeight.w500,
          //     ),
        ),
        // backgroundColor: Color.fromARGB(183, 116, 116, 116),
        backgroundColor: Color.fromARGB(68, 123, 196, 255),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return SSO();
                  },
                ),
              );
            },
            icon: Icon(Icons.lock_open),
          ),
        ],
        // foregroundColor: Color.fromARGB(255, 103, 225, 255),
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
          children: [
            const Center(
              child: Text(
                'Book an event',
                style: TextStyle(
                  color: Color.fromARGB(204, 255, 255, 255),
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(83, 158, 158, 158),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(width: 1.0, color: Colors.white),
              ),
              onPressed: _presentDatePicker,
              // onPressed: () {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return Dialog(
              //           shape: RoundedRectangleBorder(
              //               borderRadius:
              //                   BorderRadius.circular(20.0)), //this right here
              //           child: Container(
              //             height: 420,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: Color.fromARGB(255, 228, 249, 255),
              //             ),
              //             padding: EdgeInsets.only(
              //               bottom: 15,
              //             ),
              //             child: Column(
              //               children: [
              //                 TableCalendar(
              //                   calendarStyle: CalendarStyle(
              //                       // defaultTextStyle: TextStyle()
              //                       // selectedDecoration: BoxDecoration(
              //                       //   color: Colors.red,
              //                       //   shape: BoxShape.rectangle,
              //                       //   borderRadius: BorderRadius.circular(10),
              //                       // ),
              //                       ),
              //                   headerStyle: HeaderStyle(
              //                     formatButtonVisible: false,
              //                     titleCentered: true,
              //                     // titleTextStyle: TextStyle(
              //                     //   color: Color.fromARGB(204, 255, 255, 255),
              //                     // ),
              //                     // leftChevronIcon: Icon(
              //                     //   Icons.chevron_left,
              //                     //   color: Color.fromARGB(204, 255, 255, 255),
              //                     // ),
              //                     // rightChevronIcon: Icon(
              //                     //   Icons.chevron_right,
              //                     //   color: Color.fromARGB(204, 255, 255, 255),
              //                     // ),
              //                   ),
              //                   firstDay: DateTime.now(),
              //                   lastDay: DateTime.utc(2030, 3, 14),
              //                   focusedDay: DateTime.now(),
              //                   selectedDayPredicate: (day) {
              //                     return isSameDay(_selectedDay, day);
              //                   },
              //                   onDaySelected: (selectedDay, focusedDay) {
              //                     setState(() {
              //                       _selectedDay = selectedDay;
              //                       _focusedDay = focusedDay;
              //                     });
              //                   },
              //                 ),
              //                 TextButton(
              //                   onPressed: Navigator.of(context).pop,
              //                   child: Text('Select Date'),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       });
              // },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              label: Text(
                DateFormat.yMd().format(_selectedDay),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Color.fromARGB(255, 228, 249, 255),
            //   ),
            //   padding: EdgeInsets.only(
            //     bottom: 15,
            //   ),
            //   child: TableCalendar(
            //     calendarStyle: CalendarStyle(
            //         // defaultTextStyle: TextStyle()
            //         // selectedDecoration: BoxDecoration(
            //         //   color: Colors.red,
            //         //   shape: BoxShape.rectangle,
            //         //   borderRadius: BorderRadius.circular(10),
            //         // ),
            //         ),
            //     headerStyle: HeaderStyle(
            //       formatButtonVisible: false,
            //       titleCentered: true,
            //       // titleTextStyle: TextStyle(
            //       //   color: Color.fromARGB(204, 255, 255, 255),
            //       // ),
            //       // leftChevronIcon: Icon(
            //       //   Icons.chevron_left,
            //       //   color: Color.fromARGB(204, 255, 255, 255),
            //       // ),
            //       // rightChevronIcon: Icon(
            //       //   Icons.chevron_right,
            //       //   color: Color.fromARGB(204, 255, 255, 255),
            //       // ),
            //     ),
            //     firstDay: DateTime.now(),
            //     lastDay: DateTime.utc(2030, 3, 14),
            //     focusedDay: DateTime.now(),
            //     selectedDayPredicate: (day) {
            //       return isSameDay(_selectedDay, day);
            //     },
            //     onDaySelected: (selectedDay, focusedDay) {
            //       setState(() {
            //         _selectedDay = selectedDay;
            //         _focusedDay =
            //             focusedDay; // update `_focusedDay` here as well
            //       });
            //     },
            //   ),
            // ),
            Container(
              height: 560,
              child: MeetingList(meets: meets),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addNewMeeting(context),
      ),
    );
  }
}
