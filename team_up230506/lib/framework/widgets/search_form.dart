import 'package:flutter/cupertino.dart';
import '../../framework/widgets/widget-factory.dart';


import '../models/MasterUiConfig.dart';
import '../models/search_request.dart';

class SearchForm {

  MasterUiConfig uiConfig;
  PageableSearchRequest sr;

  SearchForm(this.uiConfig, this.sr);

   List<Widget> getFormFieldsFromUiConfig(MasterUiConfig uiConfig, Map<String, dynamic> formData, BuildContext? context) {
    return WidgetFactory.getFormFromFieldDefs(uiConfig.uiDef.uiFieldDefs, formData, context);
  }
}