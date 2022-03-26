import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SonucPage extends StatelessWidget {
  late int a;
  SonucPage({this.a = 31});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(a.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      )),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Geri Dönmek için Tıkla",
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
