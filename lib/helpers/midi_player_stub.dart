import 'midi_player_provider.dart';

class MidiPlayerPlatform implements MidiPlayer {
  @override
  Future<void> init(String asset) async {
    throw UnimplementedError('Platform not supported');
  }

  @override
  void play(int midi, {double volume = 1.0}) {
    throw UnimplementedError('Platform not supported');
  }
}
