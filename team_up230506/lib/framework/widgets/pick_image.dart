import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../app-settings/Styles.dart';



class PickImageDevice extends StatefulWidget {
  const PickImageDevice({Key? key}) : super(key: key);

  @override
  PickImageDeviceState createState() => PickImageDeviceState();
}

class PickImageDeviceState extends State<PickImageDevice> {
  File? _image;

  Future _imgFromCamera() async {
    var image = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  Future _imgFromGallery() async {
    var image = await  ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image =  File(image!.path);
    });
  }

   void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: const Color(0xffFDCF09),
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Styles.grey,
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,
                  child: const Icon(
                    Icons.camera_alt,
                    color: Styles.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}