import 'package:flutter/material.dart';
import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/ui/screens/AddEditScreen/components/add_edit_form.dart';
import 'package:my_quiz/utils/size_config.dart';

class Body extends StatelessWidget {
  //note details
  final Note? note;
  const Body({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPropotionateScreenWidth(20),
            ),
            child: AddEditForm(note :note),
          ),
        ),
      ),
    );
  }
}
