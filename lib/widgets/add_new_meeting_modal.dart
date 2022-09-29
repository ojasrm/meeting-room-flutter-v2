import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class AddNewMeetingModal extends StatefulWidget {
  const AddNewMeetingModal({Key? key, required this.addNewMeet})
      : super(key: key);
  final Function addNewMeet;

  @override
  State<AddNewMeetingModal> createState() => _AddNewMeetingModalState();
}

class _AddNewMeetingModalState extends State<AddNewMeetingModal> {
  final eventNameController = TextEditingController();
  final attendeesController = TextEditingController();
  final eventDateController = TextEditingController();
  final locationController = TextEditingController();
  final officeController = TextEditingController();
  final roomController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();

  // void _submitData() {
  //   final eventName = eventNameController.text;
  //   final attendees = attendeesController.text;

  //   if (eventName.isEmpty || attendees.isEmpty) {
  //     return;
  //   }
  //   Navigator.of(context).pop();
  //   widget.addNewMeet(
  //     eventName: eventName,
  //     organiser: 'ojas.mahajan@searce.com',
  //     location: location,
  //     office: office,
  //     room: room,
  //     startTime: _startTime,
  //     endTime: _endTime,
  //     // attendees: attendees,
  //   );
  // }
  int defaultLocation = 0;
  int defaultOffice = 0;
  int defaultRoom = 0;

  // String location = 'Pune';
  // String office = 'Searce | Pune 1';
  // String room = 'Conference Room A';

  var locations = [
    'Pune',
    'Mumbai',
    'Bangalore',
    'Ahmedabad',
  ];
  var offices = [
    'Searce | Pune 1',
    'Searce | Pune 2',
  ];
  var rooms = [
    'Conference Room A',
    'Meeting Room',
    'Gurukul',
    'Director Cabin',
  ];

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void addStartTime(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: 20),
            height: 370,
            child: Column(
              children: [
                Text(
                  'Pick a Start Time',
                  style: TextStyle(fontSize: 20),
                ),
                TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: TextStyle(
                    fontSize: 15,
                  ),
                  highlightedTextStyle:
                      TextStyle(fontSize: 20, color: Colors.blue),
                  spacing: 50,
                  itemHeight: 80,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      _startTime = time;
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.done),
                ),
              ],
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void addEndTime(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: 20),
            height: 370,
            child: Column(
              children: [
                Text(
                  'Pick an End Time',
                  style: TextStyle(fontSize: 20),
                ),
                TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: TextStyle(
                    fontSize: 15,
                  ),
                  highlightedTextStyle:
                      TextStyle(fontSize: 20, color: Colors.blue),
                  spacing: 50,
                  itemHeight: 80,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      _endTime = time;
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.done),
                ),
              ],
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void meetingCreated(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            child: ElevatedButton(
              child: Image.asset(
                'assets/images/check.png',
                scale: 4,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            // Column(
            //   children: [
            //     Image.asset(
            //       'assets/images/check.png',
            //       scale: 2,
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //         Navigator.of(context).pop();
            //       },
            //       icon: Icon(Icons.done),
            //     ),
            //   ],
            // ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Book a new event',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Event Name'),
                    controller: eventNameController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Attendees'),
                    keyboardType: TextInputType.number,
                    controller: attendeesController,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chose Date'),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: _presentDatePicker,
                          child: Text(
                            DateFormat.yMd().format(_selectedDate),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Change start time'),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () => addStartTime(context),
                          child: Text(
                            DateFormat.Hm().format(_startTime),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Change end time'),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () => addEndTime(context),
                          child: Text(
                            DateFormat.Hm().format(_endTime),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Wrap(
                    spacing: 14,
                    children: List.generate(locations.length, (index) {
                      return ChoiceChip(
                        labelPadding: EdgeInsets.all(2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        label: Text(
                          locations[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        selected: defaultLocation == index,
                        selectedColor: Color.fromARGB(255, 82, 173, 195),
                        onSelected: (value) {
                          setState(() {
                            defaultLocation = value ? index : defaultLocation;
                          });
                        },
                        // backgroundColor: color,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Office',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Wrap(
                    spacing: 14,
                    children: List.generate(offices.length, (index) {
                      return ChoiceChip(
                        labelPadding: EdgeInsets.all(2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        label: Text(
                          offices[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        selected: defaultOffice == index,
                        selectedColor: Color.fromARGB(255, 82, 173, 195),
                        onSelected: (value) {
                          setState(() {
                            defaultOffice = value ? index : defaultOffice;
                          });
                        },
                        // backgroundColor: color,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Room',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Wrap(
                    spacing: 14,
                    children: List.generate(rooms.length, (index) {
                      return ChoiceChip(
                        labelPadding: EdgeInsets.all(2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        label: Text(
                          rooms[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        selected: defaultRoom == index,
                        selectedColor: Color.fromARGB(255, 82, 173, 195),
                        onSelected: (value) {
                          setState(() {
                            defaultRoom = value ? index : defaultRoom;
                          });
                        },
                        // backgroundColor: color,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
                  ),
                  // Text(
                  //   'Location',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  // DropdownButton(
                  //   value: location,
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   // dropdownColor: Color.fromARGB(255, 176, 246, 255),
                  //   items: locations.map((String items) {
                  //     return DropdownMenuItem(
                  //       value: items,
                  //       child: Text(items),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       location = newValue!;
                  //     });
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   'Office',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  // DropdownButton(
                  //   value: office,
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   items: offices.map((String items) {
                  //     return DropdownMenuItem(
                  //       value: items,
                  //       child: Text(items),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       office = newValue!;
                  //     });
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   'Room',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  // DropdownButton(
                  //   value: room,
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   items: rooms.map((String items) {
                  //     return DropdownMenuItem(
                  //       value: items,
                  //       child: Text(items),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       room = newValue!;
                  //     });
                  //   },
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(labelText: 'Location'),
                  //   controller: locationController,
                  //   onSubmitted: (_) => _submitData(),
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(labelText: 'Office'),
                  //   controller: officeController,
                  //   onSubmitted: (_) => _submitData(),
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(labelText: 'Room'),
                  //   controller: roomController,
                  //   onSubmitted: (_) => _submitData(),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () => {
                          Navigator.of(context).pop(),
                          // meetingCreated(context),
                          widget.addNewMeet(
                            eventName: eventNameController.text,
                            organizer: 'Ojas Mahajan',
                            location: locations[defaultLocation],
                            office: offices[defaultOffice],
                            room: rooms[defaultRoom],
                            startTime: _startTime,
                            endTime: _endTime,
                            attendees: attendeesController.text,
                            isActive: false,
                            isCheckedIn: false,
                          ),
                        },
                        icon: Icon(
                          Icons.add,
                          // size: 24.0,
                          color: Color.fromARGB(255, 0, 124, 4),
                        ),
                        label: Text(
                          'Create event',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 124, 4),
                            fontSize: 16,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          // minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () => {
                      //     Navigator.of(context).pop(),
                      //     // meetingCreated(context),
                      //     widget.addNewMeet(
                      //       eventName: eventNameController.text,
                      //       organizer: 'Ojas Mahajan',
                      //       location: locations[defaultLocation],
                      //       office: offices[defaultOffice],
                      //       room: rooms[defaultRoom],
                      //       startTime: _startTime,
                      //       endTime: _endTime,
                      //       attendees: attendeesController.text,
                      //       isActive: false,
                      //       isCheckedIn: false,
                      //     ),
                      //   },
                      //   child: Text('Create event'),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
