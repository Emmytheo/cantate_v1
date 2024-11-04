import '../../../Constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class CategoryStoryItem extends StatelessWidget {
  final String name;
  const CategoryStoryItem({
    Key? key, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10,bottom: 10),
      child: Container(
      decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(10),
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
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 25,top: 5,bottom: 5),
        child: Text(name,
        style: const TextStyle(
          color: white,
          fontWeight: FontWeight.w500,
          fontSize: 15
        ),),
      ),
          ),
    );
  }
}