import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twime/config/constants.dart';
import 'package:email_validator/email_validator.dart';
import '../../config/utils.dart';
import '../../main.dart';
import 'google_sign_in.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback toggle;
  LoginWidget({Key? key, required this.toggle}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 3,
            ),
            TextFormField(
              autofocus: false,
              controller: emailController,
              cursorColor: Colors.grey[700],
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 16),
                  hoverColor: Colors.white,
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.65),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) {
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null;
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              autofocus: false,
              controller: passwordController,
              cursorColor: Colors.grey[700],
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 16),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.65),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
              obscureText: true,
              validator: (password) {
                password != null && password.length < 6
                    ? 'Şifreniz en az 6 haneli olmalı'
                    : null;
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            ForgotPassword(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.lightBlueAccent),
                    primary: Palette.darkBlue,
                    onPrimary: Palette.white),
                onPressed: emailSignIn,
                child: Text(
                  'Log In',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              'OR',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[200]),
            ),
            SizedBox(
              height: 15,
            ),
            GoogleSign(),
            Spacer(),
            Divider(
              height: 5,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(''
                    'Don\'t have an account?'),
                TextButton(
                    onPressed: widget.toggle,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future emailSignIn() async {
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message, Colors.red);
    }
    navigatorKey.currentState!.popUntil((route) {
      FocusManager.instance.primaryFocus?.unfocus();
      return route.isFirst;
    });
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          print('forgot pass');
        },
        child: Text(
          'Forgot password?',
          style: TextStyle(
              color: Palette.white,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

class GoogleSign extends StatelessWidget {
  const GoogleSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            side: BorderSide(width: 1, color: Colors.lightBlueAccent),
            primary: Palette.darkBlue,
            onPrimary: Palette.white,
            minimumSize: Size(0, 40),
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          icon: FaIcon(FontAwesomeIcons.google),
          label: Text(
            '  Sign Up with Google',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
