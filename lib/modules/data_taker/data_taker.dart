import 'package:bmi/modules/search_screen/search_screen.dart';
import 'package:bmi/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class DataTakerScreen extends StatefulWidget {
  const DataTakerScreen({Key? key}) : super(key: key);

  @override
  _DataTakerScreenState createState() => _DataTakerScreenState();
}

class _DataTakerScreenState extends State<DataTakerScreen> {
  var customernamecontroller = TextEditingController();
  var customernumbercontroller = TextEditingController();
  var customerEmailcontroller = TextEditingController();
  var dateControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  var dateAndTimeControler = TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'DCA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      '${DateTime.now()}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 980,
                    // ),
                    const Text(
                      'User Name',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultformfield(
                  controller: customernamecontroller,
                  type: TextInputType.text,
                  vlidate: (vlaue) {
                    if (vlaue.isEmpty) {
                      return 'Customer name must not be empty';
                    }
                    return null;
                  },
                  label: 'Customer Name',
                  prefix: Icons.account_circle_outlined,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultformfield(
                    controller: customernumbercontroller,
                    type: TextInputType.number,
                    vlidate: (vlaue) {
                      if (vlaue.isEmpty) {
                        return 'Customer number must not be empty';
                      }
                      return null;
                    },
                    label: 'Customer number',
                    prefix: Icons.phone_android_rounded),
                const SizedBox(
                  height: 10.0,
                ),
                defaultformfield(
                  controller: customerEmailcontroller,
                  type: TextInputType.emailAddress,
                  vlidate: (vlaue) {
                    if (vlaue.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                  label: 'Email',
                  prefix: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultformfield(
                  controller: dateControler,
                  type: TextInputType.datetime,
                  ontap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2030-12-03'),
                    ).then((value) {
                      dateControler.text = DateFormat.yMMMMd().format(value!);
                      // ignore: avoid_print
                      print(dateControler.text);
                    });
                  },
                  vlidate: (String? value) {
                    if (value!.isEmpty) {
                      return 'date must be not empty';
                    }
                    return null;
                  },
                  label: 'PTP',
                  prefix: Icons.calendar_today,
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultformfield(
                  controller: dateAndTimeControler,
                  type: TextInputType.text,
                  enable: enable,
                  ontap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2050-05-25'),
                    ).then((value) {
                      dateAndTimeControler.text =
                          DateFormat.yMMMd().format(value!);
                    });
                  },
                  vlidate: (String? value) {
                    if (value!.isEmpty) {
                      return 'date must be not empty';
                    }
                    return null;
                  },
                  label: 'Call Back Date',
                  prefix: Icons.phone_callback,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    defaultBotton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          // ignore: avoid_print
                          print(
                              'saved sucssefly ${customernamecontroller.text} ${customernumbercontroller.text} ${customerEmailcontroller.text} ${dateControler.text}');
                        }
                      },
                      width: 500,
                      text: 'Save',
                    ),
                    const SizedBox(
                      width: 613,
                    ),
                    Checkbox(
                        value: checkBoxValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue = newValue!;
                          });
                          if (checkBoxValue == true) {
                            enable = true;
                          } else {
                            enable = false;
                          }
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    defaultBotton(
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                      },
                      width: 200.0,
                      text: 'Search',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
