import 'package:flutter/material.dart';

import '../validators/validators.dart';

class AddToDoScreenConfig {
  final List<AddToDoInputType> inputs;

  AddToDoScreenConfig(this.inputs);
  AddToDoScreenConfig.fromJson(dynamic dynamic)
      : inputs = dynamic.map((e) {
          if (e["type"] == "text") {
            return AddToDoTextInput.fromJson(e);
          } else if (e["type"] == "check") {
            return AddToDoCheckboxInput.fromJson(e);
          } else if (e["type"] == "container"){
            return AddToDoContainerInput.fromJson(e);
          }
          return null;
        }).toList().cast<AddToDoInputType>();
}

abstract class AddToDoInputType {
  final String fieldName;
  AddToDoInputType(this.fieldName);
}

class AddToDoTextInput extends AddToDoInputType {
  final String hintText;
  final Function(String) validator;

  AddToDoTextInput(this.hintText, this.validator, String fieldName)
      : super(fieldName);

  static AddToDoTextInput fromJson(dynamic) {
    return AddToDoTextInput(dynamic["hintText"],
        validatorMap[dynamic["validator"]]!, dynamic["fieldName"]);
  }
}

class AddToDoCheckboxInput extends AddToDoInputType {
  final bool selectedByDefault;
  final String checkboxTitle;

  AddToDoCheckboxInput(
      this.selectedByDefault, String fieldName, this.checkboxTitle)
      : super(fieldName);

  static AddToDoCheckboxInput fromJson(dynamic) {
    return AddToDoCheckboxInput(dynamic["selectedByDefault"],
        dynamic["checkboxTitle"], dynamic["fieldName"]);
  }
}
class AddToDoContainerInput extends AddToDoInputType{
  final double height;
  final double width;
  final Color color;

  AddToDoContainerInput(this.height, this.width, this.color, String fieldName)
  : super(fieldName);

  static AddToDoContainerInput fromJson(dynamic){
    return AddToDoContainerInput(dynamic["height"], dynamic["width"],
        dynamic["color"], dynamic["fieldName"]);
  }
}