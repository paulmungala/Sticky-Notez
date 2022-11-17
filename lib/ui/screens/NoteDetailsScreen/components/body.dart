import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_quiz/data/db/notes_database.dart';
import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/ui/screens/AddEditScreen/add_edit_screen.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class Body extends StatefulWidget {
  final int noteId;

  const Body({super.key, required this.noteId});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Note? note;
  // loading state
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropotionateScreenWidth(20),
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getPropotionateScreenHeight(30),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(
                        note!.createdTime,
                      ),
                      style: TextStyle(
                        color: kSecondaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getPropotionateScreenHeight(30),
                    ),
                    Text(
                      note!.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getPropotionateScreenWidth(20),
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: getPropotionateScreenHeight(30),
                    ),
                    Text(note!.description),
                    SizedBox(
                      height: getPropotionateScreenHeight(350),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getPropotionateScreenWidth(56),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () async {
                          if (isLoading) return;

                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddEditScreen(note: note),
                          ));
                        },
                        child: Text(
                          "Edit Note",
                          style: TextStyle(
                            fontSize: getPropotionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: getPropotionateScreenHeight(20),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
