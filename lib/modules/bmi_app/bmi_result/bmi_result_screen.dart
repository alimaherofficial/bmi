import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class BmiResultScreen extends StatelessWidget {
  final bool? genderx;
  final int? agex;
  final int? resultx;

  // ignore: use_key_in_widget_constructors
  const BmiResultScreen({
    @required this.agex,
    @required this.genderx,
    @required this.resultx,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Image(
              image: AssetImage(
                'assets/images/flower.png',
              ),
              height: 40.0,
              width: 40.0,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              'Gender : ${genderx! ? 'male' : 'female'}',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
            Text(
              'Result : $resultx',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
            Text(
              'Age : $agex',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
