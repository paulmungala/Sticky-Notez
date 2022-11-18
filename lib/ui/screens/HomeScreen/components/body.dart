import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_quiz/data/db/notes_database.dart';
import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/ui/screens/HomeScreen/components/note_card.dart';
import 'package:my_quiz/ui/screens/HomeScreen/home_screen.dart';
import 'package:my_quiz/ui/screens/NoteDetailsScreen/note_details_screen.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class Body extends StatefulWidget {
  final bool isGrid;
  const Body({super.key, required this.isGrid});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // notes
  late List<Note> notes;

  //loading bool
  bool loading = true;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: kPrimaryColor),
      gapPadding: 10,
    );
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropotionateScreenWidth(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: getPropotionateScreenHeight(10),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: getPropotionateScreenWidth(5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getPropotionateScreenHeight(10),
                      vertical: getPropotionateScreenHeight(10),
                    ),
                    hintText: "Search for Notes",
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  onChanged: searchNote,
                ),
              ),
              SizedBox(
                height: getPropotionateScreenHeight(10),
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : notes.isEmpty
                      ? Text(
                          "None so far",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: getPropotionateScreenWidth(18),
                          ),
                        )
                      : Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                  child: RefreshIndicator(
                                onRefresh: refreshNotes,
                                color: kPrimaryColor,
                                child: buildNotes(),
                              )),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }

  // to build note tiles
  Widget buildNotes() => MasonryGridView.count(
        crossAxisCount: isGrid == true ? 2 : 1,
        crossAxisSpacing: 2,
        itemCount: notes.length,
        mainAxisSpacing: 2,
        itemBuilder: (BuildContext context, int index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailsScreen(noteId: note.id!),
              ));
            },
            child: NoteCard(note: note, index: index),
          );
        },
      );

  // getting all notes
  Future refreshNotes() async {
    setState(() => loading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => loading = false);
  }

  // search for notes
  void searchNote(String query) {
    final suggestions = notes.where((note) {
      final noteTitle = note.title.toLowerCase();
      final input = query.toLowerCase();

      return noteTitle.contains(input);
    }).toList();

    setState(() {
      notes = suggestions;
    });

    if (query.isEmpty) {
      refreshNotes();
    }
  }
}
