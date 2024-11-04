import '../../../ui/widgets/circle_track.dart';
import '../../../ui/widgets/square_track.dart';
import 'package:flutter/cupertino.dart';

class TrackGroup {
  String group;
  double height;
  List<Widget> trackWidget;
  TrackGroup(this.group, this.height, this.trackWidget);
}

List<TrackGroup> tracks = [
  TrackGroup("Featured", 200, [
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
  ]),
  TrackGroup("Popular", 200, [
    const CircleTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const CircleTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const CircleTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const CircleTrack(content: ["Song Name", "By ", "..."], height: 120,),
  ]),
  TrackGroup("Hymns", 200, [
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
  ]),
  TrackGroup("Traditional", 200, [
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
    const SquareTrack(content: ["Song Name", "By ", "..."], height: 120,),
  ]),
];
