import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';



class CreateTeamInput extends StatefulWidget {
  const CreateTeamInput(
      {Key? key,
        @required this.controller,
        @required this.hintText,
        @required this.validator})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validator;

  @override
  State<CreateTeamInput> createState() => _CreateTeamInputState();
}

class _CreateTeamInputState extends State<CreateTeamInput> {
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


