import 'package:flutter/material.dart';

class PermissionUI extends StatelessWidget {
  final String name;
  final String description;
  final String imageSrc;
  final VoidCallback onAllowing;
  final VoidCallback onCancel;

  const PermissionUI({Key? key,required this.name,required this.description,required this.imageSrc,required this.onAllowing,required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(5),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.blue,
                    ),
                    onPressed: onCancel,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        child: CircleAvatar(
                          backgroundImage:AssetImage(imageSrc)
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                        width: double.infinity,
                      ),
                      Text(name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25.0,
                        ), 
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(description,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: onAllowing, 
                          child: const Text('Allow access',
                          style: TextStyle(
                            fontSize: 18.0,
                            )
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ),
        ));
  }
}
