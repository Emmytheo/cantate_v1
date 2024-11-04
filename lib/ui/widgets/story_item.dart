import '../../../Constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class StoryItem extends StatelessWidget {
  final String img;
  final String name;
  const StoryItem({
    Key? key, required this.img, required this.name, 

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,bottom: 10, top: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: secondaryColor,
          boxShadow: [
                const BoxShadow(
                    color: Colors.black,
                    offset: Offset(3, 3),
                    blurRadius: 10,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(-3, -3),
                    blurRadius: 10,
                    spreadRadius: 1),
            ],
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: 
              NetworkImage(img,),fit: BoxFit.cover)
        ),
        child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 4,
            child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
            // shape: BoxShape.circle,
            boxShadow: [
                  const BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                      blurRadius: 10,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.grey.shade800,
                      offset: const Offset(-3, -3),
                      blurRadius: 10,
                      spreadRadius: 1),
              ],
            borderRadius: BorderRadius.circular(50),
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: storyBorderColor)
            color: blue_story,
            
                  ),
                  child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(
                  color: black,
                  width: 2
                ),
                color: secondaryColor,
                boxShadow: [
                  const BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                      blurRadius: 10,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.grey.shade800,
                      offset: const Offset(-3, -3),
                      blurRadius: 10,
                      spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(50),
                // shape: BoxShape.circle,
                image: DecorationImage(image: 
                NetworkImage(img,),fit: BoxFit.cover)
              ),
            ),
                  ),
              ),
          ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                    width: 70,
                    child: 
                    Text(name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: white
                    ),),
              ),
            )
        ],
            ),
      ),
    );
  }
}