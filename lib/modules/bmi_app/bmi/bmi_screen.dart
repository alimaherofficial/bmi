import 'dart:math';
import 'package:bmi/modules/bmi_app/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  BmiScreenState createState() => BmiScreenState();
}

class BmiScreenState extends State<BmiScreen> {
  bool male = true;
  double height = 160.0;
  double weight = 70;
  int age = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Bmi calculator')),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            male = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: male ? Colors.green[300] : Colors.blue[200],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Image(
                                image: AssetImage('assets/images/male.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            male = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: male ? Colors.blue[200] : Colors.green[300],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Image(
                                image: AssetImage('assets/images/female.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                          // ignore: avoid_print
                          print(value.round());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              '${weight.round()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: 'widget+',
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  heroTag: 'weight-',
                                  mini: true,
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'a+',
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'ag-',
                                  mini: true,
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrange[100],
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  // ignore: avoid_print
                  print(result.round());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                          agex: age, genderx: male, resultx: result.round()),
                    ),
                  );
                },
                child: const Text(
                  'data',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
