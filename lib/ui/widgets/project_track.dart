import 'package:flutter/material.dart';

import '../../Constants/design.dart';

class ProjectTrack extends StatelessWidget {
  final double height;
  final List content;

  const ProjectTrack({
    Key? key, 
    required this.height,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 70;
    
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 300,
        height: height,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.all(12),
                decoration: neoBox(10),
                child: Row(children: [
                  Container(
                    height: double.infinity,
                    width: height - 20,
                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    margin: const EdgeInsets.only(right: 12),
                    decoration: neoBox(10),
                    child: const Icon(
                      Icons.music_note,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        content[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                          fontSize: 15,
                          fontFamily: 'Lucida',
                        ),
                      ),
                    ),
                  ],)

                ]),
              ),
            ),
          ],
        ),
      ),
    );
    
    
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(8),
    //       margin: EdgeInsets.all(8),
    //       decoration: neoBox(12),
    //       child: SizedBox(
    //         width: height,
    //         height: height,
    //       ),
    //     ),
    //   ],
    // );
  }
}
