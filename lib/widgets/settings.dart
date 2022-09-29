import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   defaultLocation = 0;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(68, 123, 196, 255),
        title: const Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/location.gif',
              // scale: 1 / 4,
              height: 300,
            ),
            Card(
              child: Container(
                // color: Color.fromARGB(144, 255, 0, 0),
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 10,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => {
                                  Navigator.of(context).pop(),
                                },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              // minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerRight,
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.green),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
