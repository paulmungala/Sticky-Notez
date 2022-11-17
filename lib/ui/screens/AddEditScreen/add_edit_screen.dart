import 'package:flutter/material.dart';
import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/ui/screens/AddEditScreen/components/body.dart';
import 'package:my_quiz/utils/constants.dart';

class AddEditScreen extends StatelessWidget {
  //note details
  final Note? note;
  
  const AddEditScreen({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Or Add',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Body(note:note),
    );
  }
}
