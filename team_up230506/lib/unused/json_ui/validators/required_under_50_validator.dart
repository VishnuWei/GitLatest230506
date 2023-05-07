String requiredUnder50Validator(String text) {
  if (text.isEmpty) {
    return "Cannot be empty";
  }

  if (text.length > 50) {
    return "Asset name must be < 50 characters";
  }

  return "";
}

String optionalDOBValidator(String context) => "";
String optionalGenderValidator(String context) => "";
String optionalLocationValidator(String context) => "";
String optionalHobbiesValidator(String context)=> "";