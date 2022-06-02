import 'package:flutter/material.dart';
import 'package:twime/config/background_painter.dart';
import 'package:twime/screens/login/login_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twime/screens/login/signup_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double sizee = MediaQuery.of(context).size.height;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _controller.forward(from: 0);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox.expand(
                child: CustomPaint(
              painter: BackgroundPainter(animation: _controller.view),
            )),
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: MediaQuery.of(context).size.width / 12.7,
              child: Text(
                'TWIME',
                style: GoogleFonts.fredokaOne(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                    fontSize: 60),
              ),
            ),
            isLogin
                ? LoginWidget(
                    toggle: toggle,
                  )
                : SignUpWidget(
                    toggle: toggle,
                  ),
          ],
        ));
  }

  bool isLogin = true;
  void toggle() => setState(() {
        isLogin = !isLogin;
        print('32');
      });
}
