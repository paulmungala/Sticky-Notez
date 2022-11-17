import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/domain/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  // global instance for the database
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  //creating the database
  Future<Database?> get database async {
    // return the database if it already exists
    if (_database != null) return _database;

    // Initialize the database if it doesn't exist
    _database = await _initDB('notez.db');

    return _database!;
  }

  Future<Database?> _initDB(String filePath) async {
    // since it is android app we dont need path_provider
    final dbPath = await getDatabasesPath();
    //joining using path package
    final path = join(dbPath, filePath);

    //open the database
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //function to create the database
  Future _createDB(Database db, int version) async {
    // id type
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';

    // text type
    const textType = 'TEXT NOT NULL';

    // making database table for user
    await db.execute('''
CREATE TABLE $tableUser ( 
  ${UserFields.id} $idType, 
  ${UserFields.email} $textType,
  ${UserFields.password} $textType
  )
''');

    // making database table for notes
    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.title} $textType,
  ${NoteFields.description} $textType,
  ${NoteFields.time} $textType
  )
''');
  }

  //create user to database
  Future<User> createUser(User user) async {
    final db = await instance.database;

    final id = await db!.insert(tableUser, user.toJson());

    return user.copy(id: id);
  }

  //create note to database
  Future<Note> createNote(Note note) async {
    final db = await instance.database;

    final id = await db!.insert(tableNotes, note.toJson());

    return note = note.copy(id: id);
  }

  // read a note
  Future<Note> readNote(int id) async {
    final db = await instance.database;

    // actual query
    final maps = await db!.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      // to prevent SQL injections
      whereArgs: [id],
    );

    // check if request is successful
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // read all notes
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    // order we want the data to come as
    const orderBy = '${NoteFields.time} ASC';


    // actual query
    final result = await db!.query(
      tableNotes,
      orderBy: orderBy,
    );

    return result.map((json) => Note.fromJson(json)).toList();
  }

  // update a note
  Future<int> update(Note note) async {
    final db = await instance.database;

    // actual query
    return db!.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  // delete a note
  Future<int> delete(int id) async {
    final db = await instance.database;

    // actual query
    return db!.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  // closing the database
  Future close() async {
    final db = await instance.database;

    db!.close();
  }
}
