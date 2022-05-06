import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twime/config/constants.dart';
import 'package:twime/config/utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.darkBlue,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Şifrenizi sıfırlamak istediğiniz\n email adresini giriniz',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                      controller: emailController,
                      autofocus: false,
                      cursorColor: Colors.grey[700],
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 16),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.65),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                      validator: (email) {
                        if (email != null && !EmailValidator.validate(email)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      }),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Palette.lightBlue,
                      minimumSize: Size.fromHeight(45)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      resetPassword();
                    }
                  },
                  label: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 26),
                  ),
                  icon: Icon(Icons.email_outlined),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Password Reset Email Sent', Colors.white);
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message, Colors.red);
      Navigator.of(context).pop();
    }
  }
}
