import 'package:flutter/material.dart';

import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF3ea0b6),
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 90,
          ),
          Center(
            child: Image.asset(
              'undraw_The_world_is_mine_re_j5cr.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              "AIR QUALITY INDEX",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            child: Center(
                child: Text(
                    "We need clean air! Air pollution is the biggest health risk in the world",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            child: Center(
                child: Text(
              "It is hard to escape - no matter where you live - and can seriously affect your health",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF00BFA6),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value as needed
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 50), // Adjust the height as needed
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AQIGaugeApp()), // Replace NextScreen() with your desired screen
                );
              },
              child: Text(
                "Get Started!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
