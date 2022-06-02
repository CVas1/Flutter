import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../config/utils.dart';
import '../../main.dart';
import 'forgot_password_page.dart';
import 'google_sign_in.dart';

class SignUpWidget extends StatefulWidget {
  final Function() toggle;
  SignUpWidget({Key? key, required this.toggle}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passRepController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passRepController.dispose();
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
              flex: 4,
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
              validator: (email) {
                if (email != null && !EmailValidator.validate(email)) {
                  return 'Enter a valid email!';
                }

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
              validator: (value) {
                if (value == null || (value.length < 6)) {
                  return 'Password is too short!';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              autofocus: false,
              controller: passRepController,
              cursorColor: Colors.grey[700],
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 16),
                  hintText: 'Repeat Password',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.65),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
              obscureText: true,
              validator: (value) {
                if (value != null &&
                    value.trim() != passwordController.text.trim()) {
                  return 'Şifreniz uyuşmuyor';
                } else
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
                onPressed: emailSignUp,
                child: Text(
                  'Sign Up',
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
                Text('Already have an account?'),
                TextButton(
                    onPressed: widget.toggle,
                    child: Text(
                      'Sign In',
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

  Future emailSignUp() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message, Colors.red);
        //showTopSnackBar(context, e.message);
      }
      navigatorKey.currentState!.popUntil((route) {
        FocusManager.instance.primaryFocus?.unfocus();
        return route.isFirst;
      });

      return;
    }
  }

  void showTopSnackBar(BuildContext context, String? message) => Flushbar(
        icon: Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        title: 'Hata',
        message: message,
        duration: Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context);
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
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
