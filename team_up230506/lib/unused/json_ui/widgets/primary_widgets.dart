import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Function? onTap;

  const PrimaryButton({Key? key, @required this.text, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       // margin: EdgeInsets.only(top: 30),
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        border: Border.all(
          width: 1,
          color: Styles.black,
        ),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        child: Text(
          text!,
          style: TextStyle(color: Styles.white),
        ),
        onPressed: () => onTap!(),
      ),
    );
  }
}
class PostField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validator;

  const PostField({Key? key, this.controller, this.hintText, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(10.0),
      height:200,
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
        maxLines: 20,
      ),
    );
  }
}
class DropOption extends StatefulWidget {
 final String? dropdownValue;
 final List<String>? typelist;
  const DropOption({Key? key, this.dropdownValue, this.typelist}) : super(key: key);

  @override
  _DropOptionState createState() => _DropOptionState();
}

class _DropOptionState extends State<DropOption> {
  List<String>? typelist;
  String? dropdownValue;
  @override
  void initState() {
   typelist=widget.typelist;
   dropdownValue=widget.dropdownValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Styles.white,
        border: Border.all(
          width: 1,
          color: Styles.black,
        ),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: InputDecorator(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              elevation: 10,
              style: TextStyle(color: Styles.black),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: typelist!
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(child: Text(value)),
                );
              }).toList(),
            ),
          )),
    );
  }
}


