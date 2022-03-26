import 'package:flutter/material.dart';
import 'kutu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnaSayfa());
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double myvalue = 0;
  double isemesuyu = 14;
  int boy = 170;
  int kilo = 65;
  Color renkKadin = Colors.white;
  Color renkErkek = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Kutu(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            "BOY",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                                color: Colors.black54,
                                wordSpacing: 3),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RotatedBox(
                            quarterTurns: 3,
                            child: Text(boy.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 40,
                                    color: Colors.blue,
                                    wordSpacing: 3))),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    boy++;
                                  });
                                },
                                child: const Text("+",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    boy--;
                                  });
                                },
                                child: const Text("-",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Kutu(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            "KİLO",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                                color: Colors.black54,
                                wordSpacing: 3),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RotatedBox(
                            quarterTurns: 3,
                            child: Text(kilo.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 40,
                                    color: Colors.blue,
                                    wordSpacing: 3))),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    kilo++;
                                  });
                                },
                                child: const Text("+",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    kilo--;
                                  });
                                },
                                child: const Text("-",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Kutu(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Günde Kaç Litre İşiyorsunuz?",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black54,
                            wordSpacing: 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          isemesuyu.round().toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 34,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Slider(
                        value: isemesuyu,
                        onChanged: (double newValue) {
                          setState(() {
                            isemesuyu = newValue;
                          });
                        },
                        max: 30,
                        min: 1,
                      )
                    ],
                  ))),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Kutu(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Günde Kaç Sigara İçiyorsunuz?",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black54,
                            wordSpacing: 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          myvalue.round().toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 34,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Slider(
                        value: myvalue,
                        onChanged: (double newValue) {
                          setState(() {
                            myvalue = newValue;
                          });
                        },
                        max: 15,
                        min: 0,
                      )
                    ],
                  ))),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        renkKadin = Colors.amberAccent;
                        renkErkek = Colors.white;
                      });
                    },
                    child: Kutu(
                        renk: renkKadin,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "KADIN",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            )
                          ],
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        renkErkek = Colors.amberAccent;
                        renkKadin = Colors.white;
                      });
                    },
                    child: Kutu(
                        renk: renkErkek,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "ERKEK",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            )
                          ],
                        )),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
