import 'package:bmi/modules/crm_app/data_taker/data_taker.dart';
import 'package:bmi/shared/components/components.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  bool ispassword = true;
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: 1000.0,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'login',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ignore: prefer_const_constructors

                      const SizedBox(
                        height: 40,
                      ),

                      defaultformfield(
                        controller: emailcontroller,
                        type: TextInputType.emailAddress,
                        vlidate: (vlaue) {
                          if (vlaue.isEmpty) {
                            return 'email must noy be empty';
                          }
                          return null;
                        },
                        label: 'User name',
                        prefix: Icons.email,
                        onSubmit: (d) {
                          // ignore: avoid_print
                          print(emailcontroller.text);
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      defaultformfield(
                        controller: passwordcontroller,
                        type: TextInputType.visiblePassword,
                        vlidate: (aassaa) {
                          if (aassaa.isEmpty) {
                            // ignore: avoid_print
                            return 'password must not be empty';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        onSubmit: (a) {
                          // ignore: avoid_print
                          print(passwordcontroller.text);
                        },
                        ispassword: ispassword,
                        suffix: ispassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixiconbotton: () {
                          setState(() {
                            ispassword = !ispassword;
                          });
                        },
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      defaultBotton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            // ignore: avoid_print
                            print(passwordcontroller.text);
                            // ignore: avoid_print
                            print(emailcontroller.text);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DataTakerScreen()));
                        },
                        text: 'login',
                        width: double.infinity,
                        color: Colors.blue,
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text('SignUp Now')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
