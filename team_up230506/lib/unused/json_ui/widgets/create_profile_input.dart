import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../app-settings/Styles.dart';



class CreateProfileInput extends StatefulWidget {
  const CreateProfileInput({Key? key,
    @required this.controller,
    @required this.hintText,
    @required this.validator
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validator;

  @override
  State<CreateProfileInput> createState() => _CreateProfileInputState();
}

class _CreateProfileInputState extends State<CreateProfileInput> {
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
        decoration: InputDecoration(hintText: widget.hintText, border: InputBorder.none),
        controller: widget.controller,
        validator: (v) => widget.validator!(v!),
      ),
    );
  }
}