import '../ui/widgets/explorers/notifications_explorer.dart';
import 'package:flutter/material.dart';
import '../Constants/color_constants.dart';


class LibraryNotifications extends StatefulWidget {
  final VoidCallback onMenuTap;
  List<String> sections;

  LibraryNotifications(
      {Key? key,
      required this.onMenuTap,
      this.sections = const [
        "Recent",
        "Featured",
        "Popular",
        "Seasons",
      ]})
      : super(key: key);

  @override
  State<LibraryNotifications> createState() => _LibraryNotificationsState();
}

class _LibraryNotificationsState extends State<LibraryNotifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: secondaryColor,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: 
          [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      onTap: widget.onMenuTap,
                      child: const Icon(Icons.menu, color: Colors.white)),
                  const Text("Library - Notifications",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  const Icon(Icons.settings, color: Colors.transparent),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 5),
              const NotificationExplorer(type: 'songs'),
              const SizedBox(height: 10),
              
            ],
          ),
        ],
      ),
    );
  }
}
