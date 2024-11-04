import 'package:flutter/material.dart';

import '../../Constants/design.dart';

class SquareTrack extends StatelessWidget {
  final double height;
  final List content;

  const SquareTrack({Key? key, required this.height, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: neoBox(12),
          width: height - 10,
          height: height - 10,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 7,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.orangeAccent
                          ),
                    ),
                  )
                ],
              ),
              const Expanded(
                child: Center(
                  child: Icon(
                    Icons.music_note,
                    size: 60,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            content[0],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Lucida',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            content[1] + " " + content[2],
            style: const TextStyle(
              color: Color.fromARGB(169, 255, 255, 255),
              fontSize: 11,
              fontFamily: 'Lucida',
            ),
          ),
        ),
      ],
    );
  }
}
