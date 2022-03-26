import 'package:flutter/material.dart';
import 'package:second_app/sonuc_sayfa.dart';
import 'package:second_app/varib.dart';
import 'kutu.dart';
import 'varib.dart';

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
  Varib varibl = Varib();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  boy(),
                  kilo(),
                ],
              ),
            ),
            isemesuyu(),
            sigara(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  kadinn(),
                  erkekk(),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SonucPage(
                              a: Varib.hesap(varibl),
                            )));
              },
              child: Text(
                "Sonucu Gör",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: Colors.black54,
                    wordSpacing: 3),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded erkekk() {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        varibl.kadin = false;
        setState(() {
          Varib.renkDegis('erkek');
        });
      },
      child: Kutu(
          renk: Varib.renkErkek,
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
    ));
  }

  Expanded kadinn() {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        varibl.kadin = true;
        setState(() {
          Varib.renkDegis("kadin");
        });
      },
      child: Kutu(
          renk: Varib.renkKadin,
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
    ));
  }

  Expanded sigara() {
    return Expanded(
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
                  varibl.myvalue.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                    color: Colors.blue,
                  ),
                ),
              ),
              Slider(
                value: varibl.myvalue,
                onChanged: (double newValue) {
                  setState(() {
                    varibl.myvalue = newValue;
                  });
                },
                max: 15,
                min: 0,
              )
            ],
          ))),
        ],
      ),
    );
  }

  Expanded isemesuyu() {
    return Expanded(
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
                  varibl.isemesuyu.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                    color: Colors.blue,
                  ),
                ),
              ),
              Slider(
                value: varibl.isemesuyu,
                onChanged: (double newValue) {
                  setState(() {
                    varibl.isemesuyu = newValue;
                  });
                },
                max: 30,
                min: 1,
              )
            ],
          ))),
        ],
      ),
    );
  }

  Expanded boy() {
    return Expanded(
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
              child: Text(varibl.boy.toString(),
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
                      varibl.boy++;
                    });
                  },
                  child: const Text("+", textAlign: TextAlign.center),
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
                      varibl.boy--;
                    });
                  },
                  child: const Text("-", textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Expanded kilo() {
    return Expanded(
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
              child: Text(varibl.kilo.toString(),
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
                      varibl.kilo++;
                    });
                  },
                  child: const Text("+", textAlign: TextAlign.center),
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
                      varibl.kilo--;
                    });
                  },
                  child: const Text("-", textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
