import 'midi_player_provider.dart';

class MidiPlayerNative implements MidiPlayer {
  @override
  Future<void> init(String asset) async {
    // Initialize native player with asset
  }

  @override
  void play(int midi, {double volume = 1.0}) {
    // Play the MIDI note at specified volume on native platform
  }
}
