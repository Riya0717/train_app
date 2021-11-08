import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:train_app/models/country.dart';
import 'package:train_app/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final countryCodeJson =
        await rootBundle.loadString("assets/files/countryCode.json");
    final decodedData = jsonDecode(countryCodeJson);
    var countryData = decodedData["country"];
    CountryModel.items = List.from(countryData)
        .map<Country>((item) => Country.fromMap(item))
        .toList();
    setState(() {});
  }

  String? _countryCode;
  String? _number;

  dataCheck() {
    if (_countryCode == null || _number == null) {
      return false;
    }

    if (_number!.length < 7 || _number!.length > 12) {
      return false;
    }

    return true;
  }

  onClick(){
   return dataCheck()?
    Navigator.pushNamed(context, AppRoutes.allowSound):null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/login.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
                          'Get started by creating your account',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 32.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8.0),
                                          bottom: Radius.zero),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8.0),
                                          bottom: Radius.zero),
                                    ),
                                    labelText: "Country/Region",
                                  ),
                                  value: _countryCode,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 25,
                                  elevation: 16,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _countryCode = newValue;
                                    });
                                  },
                                  items: CountryModel.items
                                      .map<DropdownMenuItem<String>>((obj) {
                                    return DropdownMenuItem<String>(
                                      value: obj.name,
                                      child: Text(
                                          "${obj.name} (+${obj.countryCode})"),
                                    );
                                  }).toList()),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    _number = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.zero,
                                        bottom: Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.zero,
                                        bottom: Radius.circular(8.0)),
                                  ),
                                  hintText: "Phone number ...",
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Text(
                                  'Privacy and agreements',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50.0,
                                child: ElevatedButton(
                                    onPressed: onClick,
                                    child: const Text('Login',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        )),
                                    style: ElevatedButton.styleFrom(
                                      primary: dataCheck()
                                          ? Colors.blue
                                          : Colors
                                              .black12, //background color of button
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      )),
    );
  }
}
