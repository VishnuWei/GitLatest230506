import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../app-settings/Styles.dart';



class CreatePostInput extends StatelessWidget {
  const CreatePostInput(
      {Key? key,
        @required this.controller,
        @required this.hintText,
        @required this.validator})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(10.0),
      height:50,
      decoration: BoxDecoration(
        color: Styles.white,
        border: Border.all(
          width: 1,
          color: Styles.black,
        ),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
        controller: controller,
        validator: (v) => validator!(v!),
      ),
    );
  }
}


