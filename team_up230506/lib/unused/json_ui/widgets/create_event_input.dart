import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';


class CreateEventInput extends StatefulWidget {
  const CreateEventInput(
      {Key? key,
        @required this.controller,
        @required this.hintText,
        @required this.validator})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validator;

  @override
  State<CreateEventInput> createState() => _CreateEventInputState();
}

class _CreateEventInputState extends State<CreateEventInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(10.0),
      height:50,
      decoration: BoxDecoration(
        color: Styles.white,
        border: Border.all(
          width: 1,
          color: Styles.black,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(hintText: widget.hintText, border: InputBorder.none),
        controller: widget.controller,
        validator: (v) => widget.validator!(v!),
      ),
    );
  }
}


