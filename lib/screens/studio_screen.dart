import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/models.dart';
import '../helpers/midi_player_provider.dart';

class StudioScreen extends StatefulWidget {
  @override
  _StudioScreenState createState() => _StudioScreenState();
}

class _StudioScreenState extends State<StudioScreen> {
  late MidiPlayer _midiPlayer;

  Song? song;
  bool isPlaying = false;
  bool isLooping = false;
  bool bsOpen = false;
  double currentPosition = 0.0;
  double currentPercent = 0.0;
  final String sFile = 'assets/sf2/TimGM6mb.sf2';
  ScrollController scrollController = ScrollController();

  double bpm = 120.0;
  Map<String, double> trackVolumes = {
    "soprano": 1.0,
    "alto": 1.0,
    "tenor": 1.0,
    "bass": 1.0,
  };

  Duration calculateBeatDuration() {
    return Duration(milliseconds: (60000 / bpm).round());
  }

  @override
  void initState() {
    super.initState();
    _midiPlayer = getMidiPlayer();
    loadMidiFile(sFile);
  }

  // Fetch content from the json file
  Future<void> readJson(String? songFile) async {
    songFile ??= 'assets/songs/kyrie.json';
    final String response = await rootBundle.loadString(songFile);
    final data = await json.decode(response);
    print(data);

    if (data != null) {
      setState(() {
        song = Song.fromJson(data);
        bpm = 120.0;
      });
    }
  }

  Future<void> loadMidiFile(String asset) async {
    await _midiPlayer.init(asset);
  }

  Map<String, int> solfaToMidi = {
    "d": 60,
    "r": 62,
    "m": 64,
    "f": 65,
    "s": 67,
    "l": 69,
    "t": 71,
  };

  Future<void> playNote(String note, double volume) async {
    int? midiNote = solfaToMidi[note];
    if (midiNote != null) {
      _midiPlayer.play(midiNote, volume: volume);
      // _midiPlayer.play(midiNote);
    }
  }

  void stopPlayback() {
    setState(() {
      isPlaying = false;
      currentPosition = 0.0;
      currentPercent = 0.0;
    });
  }

  void pauseSong() {
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> playSong() async {
    if (song == null) return;
    setState(() => isPlaying = true);
    Duration beatDuration = calculateBeatDuration();
    List allNotes = [];
    for (var section in song!.sections) {
      for (var part in section.parts) {
        for (var bar in part.voices["soprano"]!) {
          for (var note in bar.notes) {
            allNotes.add(note);
          }
        }
      }
    }
    if (allNotes.isEmpty) return;
    print(allNotes);
    while (isPlaying) {
      if (!isPlaying) break;

      for (var note in allNotes.indexed) {
        if (note == "-") continue;
        if (note == ".") {
          await Future.delayed(beatDuration);
          continue;
        }
        print(note);
        await playNote(note.$2, trackVolumes["soprano"]!);
        await Future.delayed(beatDuration);
        setState(() {
          currentPosition = note.$1 + 1.toDouble();
          currentPercent = currentPosition / allNotes.length;
        });

        // Scroll to the next note during playback
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent *
                (currentPosition / allNotes!.length),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }
        print(currentPosition);
      }
      if (!isLooping) break;
    }
    setState(() => isPlaying = false);

    // while (isPlaying) {
    //   for (var section in song!.sections) {
    //     if (!isPlaying) break;
    //     for (var part in section.parts) {
    //       for (var bar in part.voices["soprano"]!) {
    //         if (!isPlaying) break;
    //         for (var note in bar.notes) {

    //         }
    //       }
    //     }
    //   }
    //   if (!isLooping) break;
    // }
    // setState(() => isPlaying = false);
  }

  Future<void> loadSongFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);

    if (result != null) {
      File file = File(result.files.single.path!);
      String jsonContent = await file.readAsString();

      setState(() {
        song = Song.fromJson(json.decode(jsonContent));
        bpm = song?.bpm ?? 120.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chorister Studio'),
        actions: [
          IconButton(
            icon: Icon(Icons.upload_file),
            // onPressed: loadSongFile,
            onPressed: () => readJson('assets/songs/gloria.json'),
          ),
          IconButton(
            icon: Icon(bsOpen ? Icons.visibility : Icons.visibility_off),
            onPressed: () {},
            // onPressed: () {
            //   Scaffold.of(context).showBottomSheet(
            //     (BuildContext context) {
            //       if (song != null) {
            //         return Container(
            //           height: 200,
            //           color: Colors.amber,
            //           child: Center(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 const Text('Hello from Persistent Bottom Sheet'),
            //                 ElevatedButton(
            //                   child: const Text('Close BottomSheet'),
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                   },
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       } else {
            //         return Container();
            //       }
            //     },
            //   );
            // },

            // onPressed: () {
            //   Scaffold.of(context).showBottomSheet(
            //     (BuildContext context) {
            //       return SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Column(
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               children: [
            //                 IconButton(
            //                     onPressed: () {
            //                       Navigator.pop(context);
            //                     },
            //                     icon: Icon(Icons.close))
            //               ],
            //             ),
            //             Row(
            //               children: [
            //                 for (var bar in allNotes.indexed)
            //                   buildNoteBar(Bar(notes: [bar.$2]), bar.$1),
            //               ],
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   );
            // }
          )
        ],
      ),
      body: song == null
          ? Center(child: Text("Load a song file"))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Title: ${song?.name ?? "Unknown"}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("BPM: $bpm"),
                ),
                Expanded(child: buildSongView()),
                PlaybackProgressIndicator(currentPosition: currentPercent),
                PlaybackControls(
                  onPlay: playSong,
                  onPause: pauseSong,
                  onStop: stopPlayback,
                  isPlaying: isPlaying,
                  isLooping: isLooping,
                  bsOpen: bsOpen,
                  openDetailedPianoRoll: () {
                    openDetailedPianoRoll('soprano');
                  },
                  onToggleLooping: () {
                    setState(() {
                      isLooping = !isLooping;
                    });
                  },
                ),
              ],
            ),
    );
  }

  Widget buildSongView() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (var part in ["soprano", "alto", "tenor", "bass"])
                buildTrack(part),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTrack(String voicePart) {
    List allNotes = [];
    for (var section in song!.sections) {
      for (var part in section.parts) {
        for (var bar in part.voices[voicePart]!) {
          for (var note in bar.notes) {
            allNotes.add(note);
          }
        }
      }
    }
    return Column(
      children: [
        Text(voicePart.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold)),
        Slider(
          value: trackVolumes[voicePart]!,
          min: 0.0,
          max: 1.0,
          onChanged: (newValue) {
            setState(() {
              trackVolumes[voicePart] = newValue;
            });
          },
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: voicePart == 'soprano' ? scrollController : null,
            itemCount: allNotes.length,
            itemBuilder: (BuildContext context, int index) {
              return buildNoteBar(Bar(notes: [allNotes[index]]), index);
            },
          ),
        ),
      ],
    );
  }

  Widget buildNoteBar(Bar bar, int index) {
    return Row(
      children: [
        // for (var note in bar.notes)
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
            color: (index == currentPosition) ? Colors.yellow : Colors.white,
          ),
          child: Text(bar.notes[0]),
        ),
      ],
    );
  }

  void openDetailedPianoRoll(String voicePart) {
    if (song != null) {
      showModalBottomSheet(
        context: context,
        builder: (context) => PianoRollView(voicePart: voicePart, song: song!),
      );
    }
  }

  void openTrackDetail(String voicePart) {
    Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('$voicePart Track'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          body: Container()),
    );
    ;
  }
}

class PlaybackProgressIndicator extends StatelessWidget {
  final double currentPosition;

  PlaybackProgressIndicator({required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearProgressIndicator(
        value: currentPosition,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}

class PlaybackControls extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onStop;
  final VoidCallback onToggleLooping;
  final bool isPlaying;
  final bool bsOpen;
  final bool isLooping;
  final VoidCallback openDetailedPianoRoll;

  PlaybackControls({
    required this.onPlay,
    required this.onPause,
    required this.onStop,
    required this.onToggleLooping,
    required this.isPlaying,
    required this.isLooping,
    required this.openDetailedPianoRoll,
    required this.bsOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: isPlaying ? onPause : onPlay,
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: onStop,
          ),
          IconButton(
            icon: Icon(isLooping ? Icons.repeat : Icons.repeat_one),
            onPressed: onToggleLooping,
          ),
          IconButton(
            icon: Icon(bsOpen ? Icons.visibility : Icons.visibility_off),
            onPressed: () => openDetailedPianoRoll(),
          ),
        ],
      ),
    );
  }
}

class PianoRollView extends StatelessWidget {
  final String voicePart;
  final Song song;

  PianoRollView({required this.voicePart, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$voicePart Track')),
      body: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(8.0),
        constrained: false,
        minScale: 0.5,
        maxScale: 2.0,
        child: Column(
          children: [
            for (var section in song.sections)
              for (var part in section.parts)
                for (var bar in part.voices[voicePart]!) buildNoteRow(bar),
          ],
        ),
      ),
    );
  }

  Widget buildNoteRow(Bar bar) {
    return Row(
      children: [
        for (var note in bar.notes)
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
              color: note.isEmpty ? Colors.transparent : Colors.blue,
            ),
            child: Text(note),
          ),
      ],
    );
  }
}
