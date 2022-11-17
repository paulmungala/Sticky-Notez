import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_quiz/data/db/notes_database.dart';
import 'package:my_quiz/domain/model/user_model.dart';
import 'package:my_quiz/ui/screens/HomeScreen/home_screen.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // formkey
  final _formKey = GlobalKey<FormState>();

  // variables
  late String email;
  late String password;
  // regex
  String emailr =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String passr =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{4,}$';
  // loading state
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    email = "";
    password = "";
  }

  Future addPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('loggedIn', 'true');
  }

  Future addUser() async {
    final user = User(
      email: email,
      password: password,
    );

    await NotesDatabase.instance.createUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailFormField(context),
          SizedBox(
            height: getPropotionateScreenHeight(30),
          ),
          buildPasswordFormField(context),
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });

                  addUser();

                  addPrefs();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Sign In",
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

  //email form field
  TextFormField buildEmailFormField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "Enter your email address",
        labelText: "Email Address",
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.match(
          emailr,
          errorText: "Please enter a valid email address",
        ),
        FormBuilderValidators.email(
          errorText: "Please enter a valid email address",
        ),
        FormBuilderValidators.required(
          errorText: "Please enter your email address",
        ),
      ]),
      onChanged: (email) => setState(() => this.email = email),
    );
  }

  // password form Field
  TextFormField buildPasswordFormField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.match(
          passr,
          errorText: "use capital & small leters, a number,dd @ or #",
        ),
        FormBuilderValidators.required(
          errorText: "Please enter your password",
        ),
      ]),
      onChanged: (password) => setState(() => this.password = password),
    );
  }
}
