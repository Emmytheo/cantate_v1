import 'package:flutter/cupertino.dart';
import './color_constants.dart';
import 'package:flutter/material.dart';

BoxDecoration neoBox(double radius) {
  Color nBoxStart = neoBoxStart;
  Color nBoxEnd = neoBoxEnd.shade800;
  return BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
            color: nBoxStart,
            offset: const Offset(3, 3),
            blurRadius: 10,
            spreadRadius: 1),
        BoxShadow(
            color: nBoxEnd,
            offset: const Offset(-3, -3),
            blurRadius: 10,
            spreadRadius: 1),
      ]);
}

BoxDecoration neoBoxCircle() {
  Color nBoxStart = neoBoxStart;
  Color nBoxEnd = neoBoxEnd.shade800;
  return BoxDecoration(
      color: secondaryColor,
      boxShadow: [
        BoxShadow(
            color: nBoxStart,
            offset: const Offset(-3, -3),
            blurRadius: 10,
            spreadRadius: 1),
        BoxShadow(
            color: nBoxEnd,
            offset: const Offset(3, 3),
            blurRadius: 10,
            spreadRadius: 1),
      ]);
}

BoxDecoration trackTypeBox(double radius) {
  Color nBoxStart = neoBoxStart;
  Color nBoxEnd = neoBoxEnd.shade800;
  return BoxDecoration(
      border: const Border(
        top: BorderSide(color: Color.fromARGB(255, 187, 106, 0)),
        // bottom: BorderSide(color: Colors.transparent),
        // left: BorderSide(color: Colors.transparent),
        // right: BorderSide(color: Colors.transparent),
      ),
      color: secondaryColor,
      borderRadius: BorderRadius.only(topRight: Radius.circular(radius), bottomLeft: Radius.circular(radius), topLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
            color: nBoxStart,
            offset: const Offset(3, 3),
            blurRadius: 10,
            spreadRadius: 1),
        BoxShadow(
            color: nBoxEnd,
            offset: const Offset(-3, -3),
            blurRadius: 10,
            spreadRadius: 1),
      ]);
}