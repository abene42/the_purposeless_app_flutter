import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_purposeless_app/Controllers/authentication.dart';
import 'package:the_purposeless_app/Controllers/firestore.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          : GestureDetector(
              onTap: () async {
                setState(() {
                  _isSigningIn = true;
                });
                User? user =
                    await Authentication.signInWithGoogle(context: context);

                if (user != null) {
                  await FirestoreUtil.firstOrCreateUser(user: user);
                }

                if (user != null) {
                  setState(() {
                    _imageUrl = user.photoURL!;
                  });
                }
                setState(() {
                  _isSigningIn = false;
                });
              },
              child: _imageUrl == ''
                  ? const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/google_logo.png'),
                      radius: 25,
                      backgroundColor: Colors.white,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(_imageUrl),
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
            ),
    );
  }
}
