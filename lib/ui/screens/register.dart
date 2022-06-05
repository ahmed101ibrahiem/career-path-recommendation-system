import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/controllers/auth_controller.dart';
import 'package:pharus/models/user_model.dart';
import 'package:pharus/ui/widgets/DropDownField.dart';
import 'package:pharus/ui/widgets/buttons.dart';
import 'package:pharus/ui/widgets/textForm.dart';
import 'package:provider/provider.dart';

import 'success.dart';

enum Status { Graduated, Undergraduated }

class Register extends StatefulWidget {
  static const id = 'Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Status userStatus = Status.Graduated;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final facultyController = DropdownEditingController<String>();
  final FnameController = TextEditingController();
  final cityController = DropdownEditingController<String>();
  final userNameController = TextEditingController();
  final LnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, value, child) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: textForm(false, FnameController, 'First Name')),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: textForm(false, LnameController, 'Last Name'))
                  ],
                ),
                const SizedBox(height: 15),
                textForm(false, emailController, 'E-mail'),
                const SizedBox(height: 15),
                textForm(false, userNameController, 'User Name'),
                const SizedBox(height: 15),
                textForm(true, passwordController, 'Password'),
                const SizedBox(height: 15),
                DropDownField(
                  //controller: facultyController,
                  data: ['Engineer', 'Doctor'],
                  showIcon: false,
                  labelText: 'Faculty',
                  width: MediaQuery.of(context).size.width * .93,
                  controller: facultyController,
                ),
                const SizedBox(height: 15),
                DropDownField(
                    data: ['Mansoura', 'Giza'],
                    showIcon: false,
                    labelText: 'City',
                    width: MediaQuery.of(context).size.width * .93,
                    controller: cityController),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio<Status>(
                        value: Status.Graduated,
                        groupValue: userStatus,
                        onChanged: (val) {
                          setState(() {
                            userStatus = val;
                          });
                        }),
                    const Text(
                      'Graduated',
                      style: TextStyle(
                          fontSize: 18,
                          color: bottom,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 25),
                    Radio<Status>(
                        value: Status.Undergraduated,
                        groupValue: userStatus,
                        onChanged: (val) {
                          setState(() {
                            userStatus = val;
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
                  height: 35,
                ),
                Center(
                  child: buttons(Colors.white, bottom, 'Submit', () async {
                    print(UserModel(
                            username: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            firstName: FnameController.text,
                            lastName: LnameController.text,
                            city: cityController.value,
                            faculty: facultyController.value,
                            graduated:
                                userStatus == Status.Graduated ? true : false)
                        .toJson());
                    await value.register(
                        UserModel(
                            faculty: facultyController.value,
                            username: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            firstName: FnameController.text,
                            lastName: LnameController.text,
                            city: cityController.value,
                            graduated:
                                userStatus == Status.Graduated ? true : false),
                        context);
                  }),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
