import 'package:bmi/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  var searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Center(
          child: const Text(
            'Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            defaultformfield(
              controller: searchControler,
              type: TextInputType.text,
              vlidate: (String? value) {
                if (value!.isEmpty) {
                  return 'Search must be not empty';
                }
                return null;
              },
              label: 'Phone Number',
              prefix: Icons.search,
            ),
            const SizedBox(
              height: 50.0,
            ),
            defaultBotton(
              function: () {},
              height: 40.0,
              width: 500.0,
              text: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
