import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/methods/buttons.dart';
import 'package:pharus/methods/textForm.dart';
import 'package:pharus/screens/success.dart';

class Register extends StatefulWidget {
  static const id = 'Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FnameController = TextEditingController();
  final facultyController = TextEditingController();
  final cityController = TextEditingController();
  final LnameController = TextEditingController();

  int radioValue = 0;
  String result;
  Color resultColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                    fontSize: 30, color: bottom, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      child: textForm(false, FnameController, 'First Name')),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(child: textForm(false, LnameController, 'Last Name'))
                ],
              ),
              const SizedBox(height: 15),
              textForm(false, emailController, 'E-mail'),
              const SizedBox(height: 15),
              textForm(true, passwordController, 'Password'),
              const SizedBox(height: 15),
              textForm(false, facultyController, 'Faculty'),
              const SizedBox(height: 15),
              textForm(false, cityController, 'City'),
              const SizedBox(height: 25),
              // Text(
              //   'Graduated:',
              //   style: TextStyle(
              //       fontSize: 20, color: bottom, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.start,
              // ),
              Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (val) {
                        setState(() {
                          radioValue = val;
                          result = '1';
                          resultColor = bottom;
                        });
                      }),
                  const Text(
                    'Graduated',
                    style: TextStyle(
                        fontSize: 18,
                        color: bottom,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Radio(
                      value: 0,
                      groupValue: radioValue,
                      onChanged: (val) {
                        setState(() {
                          radioValue = val;
                          result = '0';
                          resultColor = bottom;
                        });
                      }),
                  const Text(
                    'Undergraduated',
                    style: TextStyle(
                        fontSize: 18,
                        color: bottom,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
                child: buttons(Colors.white, bottom, 'Submit', () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, Success.id);
                  });
                }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
