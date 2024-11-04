import 'midi_player_provider.dart';

class MidiPlayerWeb implements MidiPlayer {
  @override
  Future<void> init(String asset) async {
    // Initialize web player with asset
  }

  @override
  void play(int midi, {double volume = 1.0}) {
    // Play the MIDI note at specified volume on web platform
  }
}
