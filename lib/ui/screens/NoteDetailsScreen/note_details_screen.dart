import 'package:flutter/material.dart';
import 'package:my_quiz/data/db/notes_database.dart';
import 'package:my_quiz/ui/screens/HomeScreen/home_screen.dart';
import 'package:my_quiz/ui/screens/NoteDetailsScreen/components/body.dart';
import 'package:my_quiz/utils/constants.dart';

class NoteDetailsScreen extends StatelessWidget {
  // id of the note
  final int noteId;

  const NoteDetailsScreen({super.key, required this.noteId});

// Deleting the note
  Future deleteNote() async {
    await NotesDatabase.instance.delete(noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Note Details"),
        actions: [
          IconButton(
            onPressed: () async {
              deleteNote();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.delete_outline_outlined,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Body(noteId: noteId),
    );
  }
}
