import 'package:flutter/material.dart';

import '../../Constants/design.dart';

class CircleTrack extends StatelessWidget {
  final double height;
  final List content;

  const CircleTrack({
    Key? key,
    required this.height,
    required this.content
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: neoBox(180)
          // .copyWith(border: Border.all(color: Colors.blueAccent, width: 2))
          ,
          child: SizedBox(
            width: height,
            height: height,
            child: const Center(
              child: Icon(
                Icons.music_note,
                size: 60,
                color: Colors.orangeAccent,
              ),
            ),
          ),
        ),
        Text(
          content[0],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Lucida',
          ),
        ),
        Text(
          content[1] + " " + content[2],
          style: const TextStyle(
            color: Color.fromARGB(169, 255, 255, 255),
            fontSize: 11,
            fontFamily: 'Lucida',
          ),
        ),
        
      ],
    );
  }
}