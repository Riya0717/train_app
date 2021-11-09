import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:train_app/utils/routes.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _firstName;
  String? _lastName;
  final TextEditingController _dob = TextEditingController();
  @override
  void initState() {
    _dob.text = "";
    super.initState();
  }

  dataCheck() {
    if (_firstName == null || _lastName == null || _dob.text.isEmpty) {
      return false;
    }

    if (_firstName!.length < 3 || _lastName!.length < 3) {
      return false;
    }
    return true;
  }

   onClick(){
   return dataCheck()?
    Navigator.pushNamed(context, AppRoutes.loginRoute):null;
  }


  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Skip'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Account Info',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),//or 15.0
                                child: Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Color(0xffFF0E58),
                                  child: Image.asset("assets/images/avatar.jpg"),
                                ),
                              ),
                               const SizedBox(
                                height: 35,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "First name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _firstName = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Last name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _lastName = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _dob,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today),
                                  labelText: "Choose birthday date",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: _dob.text.isNotEmpty?DateTime.now() :DateTime.now(),
                                      firstDate: DateTime(1975),
                                      lastDate: DateTime.now());
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd/MM/yyyy')
                                            .format(pickedDate);
                                    setState(() {
                                      _dob.text = formattedDate;
                                    });
                                  }
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: ElevatedButton(
                                      onPressed: onClick,
                                      child: const Text('Confirm',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      style: ElevatedButton.styleFrom(
                                        primary: dataCheck()
                                          ? Colors.blue
                                          : Colors
                                              .black12, //background color of button
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }
}
