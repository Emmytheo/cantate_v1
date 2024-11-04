import 'package:flutter/material.dart';

import '../../Constants/design.dart';

class Project2Track extends StatelessWidget {
  final double height;
  final List content;

  const Project2Track({
    Key? key, 
    required this.height,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 80;
    
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 200,
        height: height,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                padding: const EdgeInsets.only(bottom: 10,),
                margin: const EdgeInsets.all(12),
                decoration: neoBox(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [Expanded(
                      child: Container(
                        height: 10,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          color: Colors.orange),
                        ),
                    )],
                    ),
                    
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.library_music,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      content[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Lucida',
                      ),
                    ),
                  ),
                ],),
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
