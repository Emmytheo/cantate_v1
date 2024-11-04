import '../../../ui/widgets/square_track.dart';
import 'package:flutter/cupertino.dart';

class InstrGroup {
  String group;
  double height;
  List<Widget> trackWidget;
  InstrGroup(this.group, this.height, this.trackWidget);
}

List<InstrGroup> instruments = [
  InstrGroup("Instruments", 200, [
    const SquareTrack(content: ["Percussion", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Wind", "By ", "..."], height: 120,),
    const SquareTrack(content: ["String", "By ", "..."], height: 120,),
  ]),
];
