// model for table name we want to create
const String tableNotes = 'notes';

// model for NoteFields
class NoteFields {
  static final List<String> values = [
    // add all fields
    id, title, description, time
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

// model for notes
class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note(
      {this.id,
      required this.title,
      required this.description,
      required this.createdTime});

  Note copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  // to convert from JSON
  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );
  // to turn to JSON
  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
