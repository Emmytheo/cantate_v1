import 'dart:convert';
// Only import `dart:ffi` on non-web platforms.
import '../helpers/models_stub.dart' // A default stub for unsupported platforms like web
    if (dart.library.io) 'models_native.dart'; // Native platform-specific model


class Song {
  final String name;
  final String category;
  final String subCategory;
  final String composer;
  final double? bpm;
  final List<Section> sections;

  Song(
      {required this.name,
      required this.category,
      required this.subCategory,
      required this.composer,
      this.bpm = 120.0,
      required this.sections});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      name: json['title'],
      category: json['category'] ?? 'None',
      subCategory: json['sub_category']  ?? 'None',
      composer: json['composer']  ?? 'None',
      bpm: json['bpm']  ?? 120.0,
      sections: (json['sections'] as List)
          .map((section) => Section.fromJson(section))
          .toList(),
    );
  }
}

class Section {
  final String type;
  final List<Part> parts;

  Section({required this.type, required this.parts});

  factory Section.fromJson(Map<String, dynamic> json) {
    print(["soprano", "alto", "tenor", "bass"].map((part) => Part.fromJson(json['parts'])));
    return Section(
      type: json.keys.first,
      parts: (["soprano", "alto", "tenor", "bass"])
          .map((part) => Part.fromJson(json['parts']))
          .toList(),
    );
  }
}

class Part {
  final Map<String, List<Bar>> voices;

  Part({required this.voices});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      voices: {
        "soprano": (json["soprano"] as List)
            .map((bar) => Bar(notes: List<String>.from(bar)))
            .toList(),
        "alto": (json["alto"] as List)
            .map((bar) => Bar(notes: List<String>.from(bar)))
            .toList(),
        "tenor": (json["tenor"] as List)
            .map((bar) => Bar(notes: List<String>.from(bar)))
            .toList(),
        "bass": (json["bass"] as List)
            .map((bar) => Bar(notes: List<String>.from(bar)))
            .toList(),
      },
    );
  }
}

class Bar {
  final List<String> notes;

  Bar({required this.notes});
}
