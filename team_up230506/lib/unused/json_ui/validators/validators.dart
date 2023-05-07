
export 'required_under_50_validator.dart';

import 'required_under_50_validator.dart';


const Map<String, Function(String)> validatorMap = {
  "optionaldob": optionalDOBValidator,
  "optionalgender": optionalGenderValidator,
  "optionallocation": optionalLocationValidator,
  "optionalhobby": optionalHobbiesValidator,
  "required_under_50": requiredUnder50Validator
};