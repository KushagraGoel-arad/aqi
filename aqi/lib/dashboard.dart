import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';

class AQIGaugeApp extends StatefulWidget {
  @override
  State<AQIGaugeApp> createState() => _AQIGaugeAppState();
}

class _AQIGaugeAppState extends State<AQIGaugeApp> {
  String _currentDateTime = '';
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _getCurrentDateTime();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void _getCurrentDateTime() {
    DateTime now = DateTime.now();
    setState(() {
      _currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    });
  }

  // Widget _getFireStroke() {
  //   return StreamBuilder(
  //     stream: FirebaseFirestore.instance
  //         .collection("weather_monitor")
  //         .doc("Readings")
  //         .snapshots(),
  //     builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text("${snapshot.error}"));
  //       } else {
  //         Map<String, dynamic> data =
  //             snapshot.data!.data() as Map<String, dynamic>;
  //         return DataTable(
  //           columns: const <DataColumn>[
  //             DataColumn(label: Text('Pollutant')),
  //             DataColumn(label: Text('Value')),
  //             DataColumn(label: Text('Description')),
  //           ],
  //           rows: <DataRow>[
  //             DataRow(
  //               cells: <DataCell>[
  //                 DataCell(Text('CO2')),
  //                 DataCell(Text(data['CO2'].toString())),
  //                 DataCell(Text('Good', style: TextStyle(color: Colors.green))),
  //               ],
  //             ),
  //             DataRow(
  //               cells: <DataCell>[
  //                 DataCell(Text('NH3')),
  //                 DataCell(Text(data['NH3'].toString())),
  //                 DataCell(Text('Good', style: TextStyle(color: Colors.green))),
  //               ],
  //             ),
  //             DataRow(
  //               cells: <DataCell>[
  //                 DataCell(Text('CO')),
  //                 DataCell(Text(data['CO'].toString())),
  //                 DataCell(Text('Satisfactory',
  //                     style: TextStyle(color: Colors.blue))),
  //               ],
  //             ),
  //             DataRow(
  //               cells: <DataCell>[
  //                 DataCell(Text('SO2')),
  //                 DataCell(Text(data['SO2'].toString())),
  //                 DataCell(
  //                     Text('Very Poor', style: TextStyle(color: Colors.red))),
  //               ],
  //             ),
  //             DataRow(
  //               cells: <DataCell>[
  //                 DataCell(Text('LPG')),
  //                 DataCell(Text(data['LPG'].toString())),
  //                 DataCell(
  //                     Text('Very Poor', style: TextStyle(color: Colors.red))),
  //               ],
  //             ),
  //             DataRow(
  //               cells: <DataCell>[
  //                 DataCell(Text('SMOKE')),
  //                 DataCell(Text(data['Smoke'].toString())),
  //                 DataCell(
  //                     Text('Very Poor', style: TextStyle(color: Colors.red))),
  //               ],
  //             ),
  //           ],
  //         );
  //       }
  //     },
  //   );
  // }

  Widget _getFireStroke() {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
              child: Text("Error initializing Firebase: ${snapshot.error}"));
        } else {
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("weather_monitor")
                .doc("Readings")
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                // Your DataTable widget here...
                return DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Pollutant')),
                    DataColumn(label: Text('Value')),
                    DataColumn(label: Text('Description')),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('CO2')),
                        DataCell(Text(data['CO2'].toString())),
                        DataCell(Text('Good',
                            style: TextStyle(color: Colors.green))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('NH3')),
                        DataCell(Text(data['NH3'].toString())),
                        DataCell(Text('Good',
                            style: TextStyle(color: Colors.green))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('CO')),
                        DataCell(Text(data['CO'].toString())),
                        DataCell(Text('Satisfactory',
                            style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('SO2')),
                        DataCell(Text(data['SO2'].toString())),
                        DataCell(Text('Very Poor',
                            style: TextStyle(color: Colors.red))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('LPG')),
                        DataCell(Text(data['LPG'].toString())),
                        DataCell(Text('Very Poor',
                            style: TextStyle(color: Colors.red))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('SMOKE')),
                        DataCell(Text(data['Smoke'].toString())),
                        DataCell(Text('Very Poor',
                            style: TextStyle(color: Colors.red))),
                      ],
                    ),
                  ],
                );
              }
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 214, 245, 240),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Today: " + _currentDateTime,
                      style: TextStyle(color: Colors.black),
                    ),
                    SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 500,
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 50,
                              color: Colors.green,
                              label: 'Good',
                            ),
                            GaugeRange(
                              startValue: 51,
                              endValue: 100,
                              color: Colors.lightGreen,
                              label: 'Satisfactory',
                            ),
                            GaugeRange(
                              startValue: 101,
                              endValue: 200,
                              color: Colors.yellow,
                              label: 'Moderate',
                            ),
                            GaugeRange(
                              startValue: 201,
                              endValue: 300,
                              color: Colors.orange,
                              label: 'Poor',
                            ),
                            GaugeRange(
                              startValue: 301,
                              endValue: 400,
                              color: Colors.red,
                              label: 'Very Poor',
                            ),
                            GaugeRange(
                              startValue: 401,
                              endValue: 500,
                              color: Colors.purple,
                              label: 'Severe',
                            ),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: 250,
                              needleStartWidth: 1,
                              needleEndWidth: 5,
                              needleColor: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "AQI: 231",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Katraj, MH",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Color.fromARGB(255, 3, 39, 68),
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: 5),
                    Center(child: _getFireStroke()),
                    // DataTable(
                    //   columns: const <DataColumn>[
                    //     DataColumn(label: Text('Pollutant')),
                    //     DataColumn(label: Text('Value')),
                    //     DataColumn(label: Text('Description')),
                    //   ],
                    //   rows: <DataRow>[
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(Text('CO2')),
                    //         DataCell(Text('4')),
                    //         DataCell(Text('Good',
                    //             style: TextStyle(color: Colors.green))),
                    //       ],
                    //     ),
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(Text('NH3')),
                    //         DataCell(Text('44')),
                    //         DataCell(Text('Good',
                    //             style: TextStyle(color: Colors.green))),
                    //       ],
                    //     ),
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(Text('CO')),
                    //         DataCell(Text('77')),
                    //         DataCell(Text('Satisfactory',
                    //             style: TextStyle(color: Colors.blue))),
                    //       ],
                    //     ),
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(Text('SO2')),
                    //         DataCell(Text('329')),
                    //         DataCell(Text('Very Poor',
                    //             style: TextStyle(color: Colors.red))),
                    //       ],
                    //     ),
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(Text('LPG')),
                    //         DataCell(Text('329')),
                    //         DataCell(Text('Very Poor',
                    //             style: TextStyle(color: Colors.red))),
                    //       ],
                    //     ),
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(Text('SMOKE')),
                    //         DataCell(Text('329')),
                    //         DataCell(Text('Very Poor',
                    //             style: TextStyle(color: Colors.red))),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 109, 224, 209),
          currentIndex: _selectedIndex, // Set the currentIndex
          onTap: (index) {
            setState(() {
              _selectedIndex = index; // Update the selected index
              if (index == 0) {
                // Navigate to the home page when the home icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage()), // Replace HomePage() with your home page
                );
              }
            });
          },
          //backgroundColor: Colors.,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
