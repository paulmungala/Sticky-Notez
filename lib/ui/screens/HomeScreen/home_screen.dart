import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/AddEditScreen/add_edit_screen.dart';
import 'package:my_quiz/ui/screens/HomeScreen/components/body.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isGrid = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notez',
          style: TextStyle(
            fontSize: getPropotionateScreenWidth(24),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          isGrid ==  true ?
          IconButton(
            onPressed: () {
              setState(() {
                isGrid = false;
              });
            },
            icon: Icon(
              Icons.list_rounded,
              color: kPrimaryColor,
            ),
          )
         : IconButton(
            onPressed: () {
              setState(() {
                isGrid = true;
              });
            },
            icon: Icon(
              Icons.grid_view_rounded,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Body(isGrid : isGrid),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddEditScreen(),
              ),
            );
          }),
    );
  }
}
