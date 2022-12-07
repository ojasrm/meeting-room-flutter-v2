import 'package:flutter/material.dart';
import './book_page.dart';
import './view_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [ViewPage(), BookPage()];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // final List<Meet> meets = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Color.fromARGB(255, 185, 245, 251),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 158, 158, 158),
            icon: Icon(Icons.meeting_room),
            label: 'Meeting room',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 158, 158, 158),
            icon: Icon(Icons.add_card),
            label: 'Booking',
          ),
        ],
      ),
    );
    // return ViewPage();
    // return BookPage();
  }
}
