import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

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
  DateTime? _dob2;
  final TextEditingController _dob = TextEditingController();
  File? _image;
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

  onClick() {
    return dataCheck() ? Navigator.pushNamed(context, AppRoutes.otp) : null;
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _image = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _image = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      _image = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
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
                              onPressed: () =>
                                  Navigator.pushNamed(context, AppRoutes.otp),
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
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20.0), //or 15.0
                                          child: _image == null
                                              ? Image.asset(
                                                  "assets/images/avatar.jpg",
                                                )
                                              : Image.file(
                                                  _image!,
                                                  fit: BoxFit.cover,
                                                )),
                                    ),
                                    Positioned(
                                        top: 65,
                                        left: 65,
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors
                                                      .black26, //background color of button
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                ),
                                                child: const Icon(
                                                    Icons.add_a_photo),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                            'Choose option',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          content:
                                                              SingleChildScrollView(
                                                            child: ListBody(
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      _pickImageCamera,
                                                                  child: Row(
                                                                    children: const [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .camera,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Camera',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      _pickImageGallery,
                                                                  child: Row(
                                                                    children: const [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .image,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                          'Gallery',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      _remove,
                                                                  child: Row(
                                                                    children: const [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove_circle,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Remove',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                })))
                                  ],
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: _dob.text.isNotEmpty
                                            ? _dob2!
                                            : DateTime.now(),
                                        firstDate: DateTime(1975),
                                        lastDate: DateTime.now());
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('dd/MM/yyyy')
                                              .format(pickedDate);
                                      setState(() {
                                        _dob.text = formattedDate;
                                        _dob2=pickedDate;
                                      });
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
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
                      ]))),
        ));
  }
}
