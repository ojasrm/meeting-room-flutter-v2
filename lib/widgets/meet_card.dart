import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../models/meet.dart';
import '../providers/meetings.dart';

class MeetCard extends StatefulWidget {
  MeetCard({
    Key? key,
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
    required this.isView,
  }) : super(key: key);

  final String eventName;
  final String organizer;
  final String location;
  final String office;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  final String attendees;
  final bool isActive;
  bool isCheckedIn;
  final bool isView;

  @override
  State<MeetCard> createState() => _MeetCardState();
}

class _MeetCardState extends State<MeetCard> {
  @override
  Widget build(BuildContext context) {
    final meetingsData = Provider.of<Meetings>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              // Colors.white,
              Color.fromARGB(255, 251, 247, 233),
              Color.fromARGB(255, 192, 192, 192),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: widget.isActive
                  ? Color.fromARGB(255, 147, 230, 251)
                  : Color.fromARGB(255, 93, 199, 226),
              // color: Color.fromARGB(255, 113, 182, 149),
              // offset: const Offset(
              //   2.0,
              //   5.0,
              // ),
              // blurRadius: 10.0,
              // spreadRadius: 1.0,
            ),
          ],
          // color: Color.fromARGB(68, 123, 196, 255),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventName,
                        style: TextStyle(
                          // color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        DateFormat.Hm().format(widget.startTime) +
                            ' to ' +
                            DateFormat.Hm().format(widget.endTime),
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),

                          fontSize: 20,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        DateFormat.yMd().format(widget.startTime),
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.room,
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 16,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.office,
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 16,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // CountdownTimer(
                      //   textStyle: TextStyle(
                      //     fontSize: 20,
                      //     // color: Colors.black,
                      //   ),
                      //   endTime: widget.endTime.millisecondsSinceEpoch +
                      //       Duration(seconds: 30).inMilliseconds,
                      // ),
                      SlideCountdown(
                        // duration: widget.isActive
                        duration: true
                            ? widget.endTime.difference(DateTime.now())
                            : widget.startTime.difference(DateTime.now()),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.organizer,
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 15,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.attendees} attendees',
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 15,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            widget.isView && widget.isActive
                ? !widget.isCheckedIn
                    ? Container(
                        padding: EdgeInsets.only(top: 10),
                        child: SlideAction(
                          onSubmit: () {
                            meetingsData.checkIn(2);
                            setState(() {
                              widget.isCheckedIn = true;
                            });
                          },
                          borderRadius: 20,
                          elevation: 4,
                          innerColor: Colors.green,
                          outerColor: Color.fromARGB(255, 248, 244, 208),
                          sliderButtonIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          ),
                          text: 'Slide to Check-in',
                          textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                          sliderRotate: false,
                          height: 55,
                        ),
                      )
                    : Container(
                        // padding: EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  // size: 24.0,
                                  color: Color.fromARGB(255, 0, 124, 4),
                                ),
                                label: Text(
                                  'Extend Meeting',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 124, 4),
                                    fontSize: 16,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  // minimumSize: Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                // <-- TextButton
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  // size: 24.0,
                                  color: Colors.red,
                                ),
                                label: Text(
                                  'End Meeting',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  // minimumSize: Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }
}
