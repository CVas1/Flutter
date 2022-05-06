import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login/google_sign_in.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('LogOut'),
      onPressed: () {
        for (UserInfo? user
            in FirebaseAuth.instance.currentUser!.providerData) {
          if (user == null) {
//6
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No one has signed in.'),
            ));
            return;
          }
          if (user.providerId == 'password') {
            FirebaseAuth.instance.signOut();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(' has successfully signed out.'),
            ));
          } else if (user.providerId == 'google.com') {
            Provider.of<GoogleSignInProvider>(context, listen: false).logout();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(' has successfully signed out.'),
            ));
          }
        }
      },
    );
  }
}
