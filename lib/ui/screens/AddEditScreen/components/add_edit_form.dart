import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_quiz/data/db/notes_database.dart';
import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/ui/screens/HomeScreen/home_screen.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class AddEditForm extends StatefulWidget {
  // note details
  final Note? note;

  const AddEditForm({super.key, this.note});

  @override
  State<AddEditForm> createState() => _AddEditFormState();
}

class _AddEditFormState extends State<AddEditForm> {
  // formkey
  final _formKey = GlobalKey<FormState>();
  // loading
  bool isLoading = false;

  //form
  late bool isImportant;
  late int number;
  late String? title;
  late String? description;

  @override
  void initState() {
    super.initState();

    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      description: description,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title!,
      description: description!,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.createNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: getPropotionateScreenHeight(30),
          ),
          Text(
            "Add or Edit",
            style: TextStyle(
              color: Colors.black,
              fontSize: getPropotionateScreenWidth(28),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Add or edit your note Here",
            style: TextStyle(
              fontSize: getPropotionateScreenHeight(12),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getPropotionateScreenHeight(50),
          ),
          buildTitleFormField(context),
          SizedBox(
            height: getPropotionateScreenHeight(20),
          ),
          buildDescriptionFormField(context),
          SizedBox(
            height: getPropotionateScreenHeight(180),
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
              onPressed: addOrUpdateNote,
              child: Text(
                "Save Note",
                style: TextStyle(
                  fontSize: getPropotionateScreenWidth(18),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // title form field
  TextFormField buildTitleFormField(BuildContext context) {
    return TextFormField(
      initialValue: title,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter a title",
        labelText: "Title",
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.required(
        errorText: "Please enter a title",
      ),
      onChanged: (title) => setState(() => this.title = title),
    );
  }

  // description form field
  TextFormField buildDescriptionFormField(BuildContext context) {
    return TextFormField(
      initialValue: description,
      maxLines: 7,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        hintText: "Type Something",
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:
          FormBuilderValidators.required(errorText: "Please enter a Note"),
      onChanged: (description) =>
          setState(() => this.description = description),
    );
  }
}
