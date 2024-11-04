import 'package:cantate_v1/helpers/midi_player_native.dart';
import 'package:cantate_v1/helpers/midi_player_web.dart';

import 'midi_player_stub.dart'
    if (dart.library.io) 'midi_player_native.dart'
    if (dart.library.js) 'midi_player_web.dart';

abstract class MidiPlayer {
  Future<void> init(String asset);
  void play(int midi, {double volume = 1.0});
}

// Return the correct player based on the platform.
MidiPlayer getMidiPlayer() {
  if (const bool.fromEnvironment('dart.library.io', defaultValue: false)) {
    return MidiPlayerNative();
  } else {
    return MidiPlayerWeb();
  }
}
