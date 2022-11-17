import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_quiz/domain/model/notes_model.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

// colors for the tiles
final _lightColors = [
  Colors.pinkAccent.shade100,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.tealAccent.shade100,
  Colors.amber.shade300,
  Colors.lightGreen.shade300
];

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  // note details
  final Note note;
  // index
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(
          getPropotionateScreenWidth(8),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                color: kSecondaryTextColor,
                fontSize: getPropotionateScreenWidth(12),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              note.title,
              style: TextStyle(
                color: kTextColor,
                fontSize: getPropotionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
