import '../library/library_create.dart';
import '../library/library_notifications.dart';
import '../library/library_projects.dart';
import '../library/library_songs.dart';
import 'package:flutter/material.dart';
import '../Constants/color_constants.dart';
// import '../bloc/navigation_bloc/navigation_bloc.dart';
import '../library/library_home.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';



class LibraryEntry extends StatefulWidget {
  final VoidCallback onMenuTap;

  const LibraryEntry({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  State<LibraryEntry> createState() => _LibraryEntryState();
}

class _LibraryEntryState extends State<LibraryEntry> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      LibraryHome(onMenuTap: widget.onMenuTap),
      LibrarySongs(onMenuTap: widget.onMenuTap),
      LibraryProjects(onMenuTap: widget.onMenuTap),
      LibraryNotifications(onMenuTap: widget.onMenuTap)
    ];
    return Scaffold(
      backgroundColor: secondaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        
          backgroundColor: bgColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    Material(
                      animationDuration: const Duration(milliseconds: 300),
                      child: LibraryCreate(onMenuTap: widget.onMenuTap)),
              ),
            );
            // setState(() {
            //   _currentIndex = 2;
            // });
          },
          child: const Icon(Icons.play_arrow_rounded, color: Colors.white,)),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.white,
        backgroundColor: bgColor,
        splashColor: secondaryColor,
        inactiveColor: Colors.grey,
        icons: const [
          Icons.home,
          Icons.explore,
          Icons.search_outlined,
          Icons.notification_important
        ],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabs[_currentIndex],
    );
  }
}
