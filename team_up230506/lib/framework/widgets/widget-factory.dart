import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../app-settings/Styles.dart';
import '../models/ApiResponseSearchResult.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../models/MasterUiConfig.dart';

class WidgetFactory {
  static EdgeInsets largeLogoEdgeInserts =
      const EdgeInsets.fromLTRB(150.0, 180.0, 0.0, 32.0);
  static EdgeInsets textBoxEdgeInserts =
      const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0);
  static EdgeInsets smallBoxEdgeInserts =
      const EdgeInsets.fromLTRB(16.0, 20.0, 125.0, 0.0);
  static EdgeInsets locationEdgeInserts =
      const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
  static EdgeInsets uploadEdgeInserts =
      const EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 6.0);
  static EdgeInsets buttonEdgeInserts =
      const EdgeInsets.only(right: 18.0, left: 18.0, top: 16);

  static InkWell getInkWellButton(
      String text, void Function(String text) onTapFun) {
    return InkWell(
        onTap: () {
          onTapFun(text);
        },
        child: Container(
          height: 52,
          decoration: Styles.buttonBoxDecoration,
          child: Center(
            child: Text(text, style: Styles.buttonTextStyle),
          ),
        ));
  }

  static InkWell getCircularButton(
      String text, void Function(String text) onTapFun) {
    return InkWell(
      onTap: () {
        onTapFun(text);
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(128, 128, 128, 100),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  static InkWell getInkWellButtonWithCallback(
      String text, void Function(String text) onTapFun) {
    return InkWell(
        onTap: () {
          onTapFun(text);
        },
        child: Container(
          height: 52,
          decoration: Styles.buttonBoxDecoration,
          child: Center(
            child: Text(text, style: Styles.buttonTextStyle),
          ),
        ));
  }

  static getInkWellTextPageNavigator(
      String text, void Function(String text) onTap) {
    return InkWell(
      onTap: () {
        onTap(text);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          text,
          style: inkWellTextStyle,
        ),
      ),
    );
  }

  static TextStyle inkWellTextStyle = const TextStyle(
      decoration: TextDecoration.none,
      fontSize: 15.0,
      color: Styles.linkBlueColor);

  static Padding getTextFormField(
      Map<String, dynamic> formData, String? fieldName, String? hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 52.0,
        //decoration: Styles.textBoxDecoration,
        // padding: textBoxEdgeInserts,
        child: TextFormField(
          style: Styles.textBoxFontStyle,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Styles.textBoxHintStyle),
          onChanged: (String? val) {
            if (fieldName != null) {
              formData[fieldName] = val;
            }
          },
        ),
      ),
    );
  }

  static Padding getParticipateFormField(
    Map<String, dynamic> formData,
    String? fieldName,
    String? hintText,
    BuildContext context,
  ) {
    bool isChecked = formData['checkboxValue'] ?? true;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Participate Yourself',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              unselectedWidgetColor: Theme.of(context).hintColor,
            ),
            child: Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                // setState(() {
                //   isChecked = value!;
                // });
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  static Widget getPasswordFormField(Map<String, dynamic> formData,
      String? fieldName, String? hintText, bool hidePassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 52.0,
        //decoration: Styles.textBoxDecoration,
        // padding: textBoxEdgeInserts,
        child: TextFormField(
          style: Styles.textBoxFontStyle,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: hidePassword,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Styles.textBoxHintStyle),
          onChanged: (String? val) {
            if (fieldName != null) {
              formData[fieldName] = val;
            }
          },
        ),
      ),
    );
  }

  static Widget getNumFormField(
      Map<String, dynamic> formData, String? fieldName, String? hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
          height: 52.0,
          child: TextFormField(
            style: Styles.textBoxFontStyle,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Styles.textBoxHintStyle,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (String? val) {
              if (fieldName != null) {
                formData[fieldName] = val;
              }
            },
          ),
      ),
    );
  }

  static Padding getRankFormField(
      Map<String, dynamic> formData, String? fieldName, String? hintText) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red,
        ),
        width: 350,
        height: 350,
      ),
    );
  }

  static Padding getButtonFormField(
      Map<String, dynamic> formData,
      String? fieldName,
      String? hintText,
      String buttonText,
      BuildContext context,
      bool isCreateClan) {
    IconData iconData = isCreateClan ? Icons.add : Icons.groups_rounded;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(11, 55, 5, 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 125.2,
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 100),
            ),
            child: IconButton(
              iconSize: 30,
              icon: Icon(
                iconData,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
          Container(
            width: 125,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Padding getTopFeedFormField(Map<String, dynamic> formData,
      String? fieldName, String? hintText, BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
      child: Container(
        width: 382.2,
        height: 65.6,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Container(
                width: 53.2,
                height: 53.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/480/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Container(
                width: 242,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 240.9,
                      height: 34.6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(-0.9, 0.4),
                        child: Text(
                          '@Username',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 189,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                              child: Text(
                                'Time',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Location',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Padding getBottomFeedFormField(Map<String, dynamic> formData,
      String? fieldName, String? hintText, BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
      child: Container(
        width: 331.4,
        height: 38.9,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Like',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Show more',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Padding getDisplayFormField(Map<String, dynamic> formData,
      String? fieldName, String? hintText, BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(40, 5, 0, 5),
      child: Container(
        width: 320.5,
        height: 153.2,
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
        ),
        child: Image.network(
          'https://picsum.photos/seed/428/600',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget getDescriptionFormField(
      Map<String, dynamic> formData, String? fieldName, String? hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: SizedBox(
        height: 102.0,
        child: TextFormField(
          style: Styles.textBoxFontStyle,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Styles.textBoxHintStyle
          ),
          onChanged: (String? val) {
            if (fieldName != null) {
              formData[fieldName] = val;
            }
          },
          maxLength: 100,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLines: 10,
        ),
      ),
    );
  }

  static Padding getDateTimePickerFormField(Map<String, dynamic> formData,
      String? fieldName, String? hintText, BuildContext context) {
    TextEditingController dateTimeInput = TextEditingController();
    TextField dateTimeTextbox = TextField(
      decoration: const InputDecoration(
        hintText: "Select Date & Time",
      ),
      controller: dateTimeInput,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
        );

        if (pickedDateTime != null) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (pickedTime != null) {
            pickedDateTime = DateTime(
              pickedDateTime.year,
              pickedDateTime.month,
              pickedDateTime.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            String period = pickedTime.period == DayPeriod.am ? 'am' : 'pm';
            String formattedDateTime =
                DateFormat('dd-MM-yyyy hh:mm $period').format(pickedDateTime);
            dateTimeInput.text = formattedDateTime;
            if (fieldName != null) {
              formData[fieldName] = formattedDateTime;
            }
          }
        }
      },
    );
    return Padding(
      padding: const EdgeInsets.only(top: 02.0, left: 125.0),
      child: Container(
        height: 75.0,
        width: 275.0,
        padding: const EdgeInsets.all(15),
        alignment: Alignment.centerRight,
        child: dateTimeTextbox,
      ),
    );
  }

  static Padding getNumberSelectFormField(
      Map<String, dynamic> formData, String? fieldName, String? hintText) {
    TextEditingController dateTimeInput = TextEditingController();
    dateTimeInput.text = "50";
    TextField dateTimeTextbox = TextField(
      controller: dateTimeInput,
      decoration: const InputDecoration(labelText: "Number of participants"),
      readOnly: true,
      onTap: () async {
        dateTimeInput.text = "500";
        if (fieldName != null) {
          formData[fieldName] = dateTimeInput.text;
        }
      },
    );

    return Padding(
      padding: const EdgeInsets.only(top: 02.0, left: 0.0),
      child: Container(
        height: 75.0,
        width: 175.0,
        padding: const EdgeInsets.all(15),
        alignment: Alignment.centerRight,
        child: dateTimeTextbox,
      ),
    );
  }

  static Padding getLocationFormField(
      Map<String, dynamic> formData, String? fieldName, String? hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 02.0),
      child: TextFormField(
        style: Styles.textBoxFontStyle,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Styles.textBoxHintStyle),
        onChanged: (String? val) {
          if (fieldName != null) {
            formData[fieldName] = val;
          }
        },
      ),
    );
  }

  static Padding getUploadMediaFormField(Map<String, dynamic> formData,
      String? fieldName, String? hintText, BuildContext? context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Create an Event',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Container(
                  width: 153.3,
                  height: 141.1,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/image-gallery.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
            child: TextButton(
              onPressed: () {
                print('Button pressed ...');
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(130, 40)),
                padding: MaterialStateProperty.all(
                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
              child: const Text('Upload Image'),
            ),
          ),
        ],
      ),
    );
  }

  static Widget bottomSheet(BuildContext? context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context!).size.width,
        color: Colors.white54,
        child: Column(
          children: <Widget>[
            const Text(
              "Choose Profile Photo",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera,
                  color: Colors.red,
                  size: 40.0,
                ),
                SizedBox(
                  width: 100,
                ),
                Icon(
                  Icons.image,
                  color: Colors.red,
                  size: 40.0,
                ),
              ],
            )
          ],
        ));
  }

  static Text getPromptNearLink(String text) {
    return Text(text, style: Styles.textStylePromptNearLink);
  }

  static List<Widget> getFormFields(List<Map<String, dynamic>> jsonUiConfig,
      Map<String, dynamic> formData, BuildContext? context) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < jsonUiConfig.length; i++) {
      Map<String, dynamic> config = jsonUiConfig[i];

      if ("TextBox" == config["widgetType"]) {
        list.add(getTextFormFieldFromConfig(formData, config));
      } else if ("Location" == config["widgetType"]) {
        list.add(getLocationFormFieldFromConfig(formData, config));
      } else if ("UploadPic" == config["widgetType"]) {
        list.add(getUploadMediaFormFieldFromConfig(formData, config, context));
      } else if ("Checkbox" == config["widgetType"]) {
        list.add(multi(config["optionsList"], formData));
      }
    }
    return list;
  }

  static Text getLogo(String s) {
    return Text(s, style: Styles.largeLogoTextStyle);
  }

  static Widget getTextFormFieldFromConfig(
      Map<String, dynamic> formData, Map<String, dynamic> config) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getTextFormField(
            formData, config["hint"], config["fieldName"]));
  }

  static Widget getLocationFormFieldFromConfig(
      Map<String, dynamic> formData, Map<String, dynamic> config) {
    return Container(
        padding: WidgetFactory.locationEdgeInserts,
        child: WidgetFactory.getLocationFormField(
            formData, config["hint"], config["fieldName"]));
  }

  static Widget getUploadMediaFormFieldFromConfig(Map<String, dynamic> formData,
      Map<String, dynamic> config, BuildContext? context) {
    return Container(
        padding: WidgetFactory.uploadEdgeInserts,
        child: WidgetFactory.getUploadMediaFormField(
            formData, config["hint"], config["fieldName"], context));
  }

  static PopupMenuItem<String> getMenuItem(String text) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(text, style: Styles.menuItemTextStyle),
    );
  }

  static RoundedRectangleBorder getAppBarShape() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)));
  }

  static Text getHomeTitleText(String text) {
    return Text(text, style: Styles.homeTitleText);
  }

  static List<Widget> getFormFromFieldDefs(List<UiFieldDef>? fieldDefs,
      Map<String, dynamic> formData, BuildContext? context) {
    List<Widget> list = <Widget>[];
    if (fieldDefs == null) {
      return <Widget>[];
    }
    for (var i = 0; i < fieldDefs.length; i++) {
      UiFieldDef fieldDef = fieldDefs[i];
      if ("TextBox" == fieldDef.widgetType) {
        list.add(getTextFormFieldFromFieldDef(fieldDef, formData));
      } else if ("Password" == fieldDef.widgetType) {
        bool hidePassword = true;
        list.add(getPasswordFormFieldFromFieldDef(fieldDef, formData, hidePassword));
      } else if ("Location" == fieldDef.widgetType) {
        list.add(getLocationFormFieldFromFieldDef(fieldDef, formData));
      } else if ("Button" == fieldDef.widgetType) {
        if ("Create a Clan" == fieldDef.displayLabel) {
          list.add(getButtonFormFieldFromFieldDef(
              fieldDef, formData, context!, 'Create Clan', true
            ),
          );
        } else if ("My Clan" == fieldDef.displayLabel) {
          list.add(getButtonFormFieldFromFieldDef(
              fieldDef, formData, context!, 'My Clan', false
            ),
          );
        }
      } else if ("Username" == fieldDef.widgetType) {
        list.add(getTopFeedFormFieldFromFieldDef(fieldDef, formData, context!));
      } else if ("Display" == fieldDef.widgetType) {
        list.add(getDisplayFormFieldFromDef(fieldDef, formData, context!));
      } else if ("ShowMore" == fieldDef.widgetType) {
        list.add(getBottomFeedFormFieldFromFieldDef(fieldDef, formData, context!));
      } else if ("NumBox" == fieldDef.widgetType) {
        list.add(getNumFormFieldFromFieldDef(fieldDef, formData));
      } else if ("Ranking" == fieldDef.widgetType) {
        list.add(getRankFormFieldFromFieldDef(fieldDef, formData));
      } else if ("Description" == fieldDef.widgetType) {
        list.add(getDescriptionFromFieldDef(fieldDef, formData));
      } else if ("DateTimePicker" == fieldDef.widgetType) {
        list.add(getDateTimePickerFromFieldDef(fieldDef, formData, context!));
      } else if ("NumberSelect" == fieldDef.widgetType) {
        list.add(getNumberOfParticipantSelectFormFieldDef(fieldDef, formData));
      } else if ("UploadMedia" == fieldDef.widgetType) {
        list.add(getUploadMediaFieldFromFieldDef(fieldDef, formData, context));
      } else if ("Participate" == fieldDef.widgetType) {
        list.add(getParticipateFormFieldFromFieldDef(fieldDef, formData, context!));
      } else if ("DropDownFixedOptions" == fieldDef.widgetType) {
        list.add(getTextFormFieldFromFieldDef(fieldDef, formData));
      } else if ("DropDownDynamicOptions" == fieldDef.widgetType) {
        list.add(getTextFormFieldFromFieldDef(fieldDef, formData));
      } else if ("LabelledText5" == fieldDef.widgetType) {
        list.add(getLabelledText5FormFieldFromFieldDef(fieldDef, formData));
      } else if ("Checkbox" == fieldDef.widgetType) {
        list.add(multi(fieldDef, formData));
      }
    }

    return list;
  }

  static List<Widget> getFormFromActionsDefs(
      List<UiActionDef>? itemDefs, void Function(String text) onTap) {
    List<Widget> list = <Widget>[];
    if (itemDefs == null) {
      return <Widget>[];
    }
    for (var i = 0; i < itemDefs.length; i++) {
      UiActionDef itemDef = itemDefs[i];
      Widget item =
          getInkWellButtonWithCallback(itemDef.displayLabel ?? "Submit", onTap);
      list.add(item);
    }
    return list;
  }

  static List<Widget> getFormActionLinksFromUiConfig(
      List<UiActionDef>? itemDefs, void Function(String text) onTap) {
    List<Widget> list = <Widget>[];
    if (itemDefs == null) {
      return <Widget>[];
    }
    for (var i = 0; i < itemDefs.length; i++) {
      UiActionDef itemDef = itemDefs[i];
      Widget item =
          getInkWellTextPageNavigator(itemDef.displayLabel ?? "Submit", onTap);
      list.add(item);
    }
    return list;
  }

  static Widget getLabelledText5FormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    String value = "";
    if (formData[fieldDef.fieldName] != null) {
      value = formData[fieldDef.fieldName];
    }
    return Text("${fieldDef.displayLabel!}:$value",
        style: const TextStyle(
            color: Styles.secondaryFontColor,
            fontSize: 16,
            fontWeight: FontWeight.normal));
  }

  static Widget getLabelledText3FormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Text(
      fieldDef.displayLabel! + ":" + formData[fieldDef.fieldName],
      style: const TextStyle(
          color: Styles.secondaryFontColor,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }

  static Widget getParticipateFormFieldFromFieldDef(UiFieldDef fieldDef,
      Map<String, dynamic> formData, BuildContext context) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getParticipateFormField(
            formData, fieldDef.fieldName, fieldDef.hint, context));
  }

  static Widget getTextFormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getTextFormField(
            formData, fieldDef.fieldName, fieldDef.hint));
  }

  static Widget getPasswordFormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData, bool hidePassword) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getPasswordFormField(
            formData, fieldDef.fieldName, fieldDef.hint, hidePassword));
  }

  static Widget getRankFormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getRankFormField(
            formData, fieldDef.fieldName, fieldDef.hint));
  }

  static Widget getNumFormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getNumFormField(
            formData, fieldDef.fieldName, fieldDef.hint));
  }

  static Widget getButtonFormFieldFromFieldDef(
      UiFieldDef fieldDef,
      Map<String, dynamic> formData,
      BuildContext context,
      String buttonText,
      bool isCreateClan) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getButtonFormField(formData, fieldDef.fieldName,
            fieldDef.hint, buttonText, context, isCreateClan));
  }

  static Widget getTopFeedFormFieldFromFieldDef(UiFieldDef fieldDef,
      Map<String, dynamic> formData, BuildContext context) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getTopFeedFormField(
            formData, fieldDef.fieldName, fieldDef.hint, context));
  }

  static Widget getBottomFeedFormFieldFromFieldDef(UiFieldDef fieldDef,
      Map<String, dynamic> formData, BuildContext context) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getBottomFeedFormField(
            formData, fieldDef.fieldName, fieldDef.hint, context));
  }

  static Widget getDisplayFormFieldFromDef(UiFieldDef fieldDef,
      Map<String, dynamic> formData, BuildContext context) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getDisplayFormField(
            formData, fieldDef.fieldName, fieldDef.hint, context));
  }

  static Widget getDescriptionFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Container(
        padding: WidgetFactory.textBoxEdgeInserts,
        child: WidgetFactory.getDescriptionFormField(
            formData, fieldDef.fieldName, fieldDef.hint));
  }

  static Widget getDateTimePickerFromFieldDef(UiFieldDef fieldDef,
      Map<String, dynamic> formData, BuildContext context) {
    return Container(
      child: WidgetFactory.getDateTimePickerFormField(
          formData, fieldDef.fieldName, fieldDef.hint, context),
    );
  }

  static Widget getNumberOfParticipantSelectFormFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Container(
        padding: WidgetFactory.smallBoxEdgeInserts,
        child: WidgetFactory.getNumFormField(
            formData, fieldDef.fieldName, fieldDef.hint));
  }

  static Widget getLocationFormFieldFromFieldDef(
      UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return Container(
        padding: WidgetFactory.locationEdgeInserts,
        child: WidgetFactory.getLocationFormField(
            formData, fieldDef.fieldName, fieldDef.hint));
  }

  static Widget getUploadMediaFieldFromFieldDef(UiFieldDef fieldDef,
      Map<String, dynamic> formData, BuildContext? context) {
    return Container(
        padding: WidgetFactory.uploadEdgeInserts,
        child: WidgetFactory.getUploadMediaFormField(
            formData, fieldDef.fieldName, fieldDef.hint, context));
  }

  static Widget getAppBar(BuildContext context, String heading) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        title: Text(heading),
        // You can add title here
        leading: getBackButton(context),
        backgroundColor: Colors.blue.withOpacity(0.3),
        //You can make this transparent
        elevation: 0.0, //No shadow
      ),
    );
  }

  static IconButton getBackButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  static ListView getItemListView(
      ApiResponseSearchResult sr,
      void Function(Map<String, dynamic>) onItemTap,
      void Function() onMoreTap) {
    List<Map<String, dynamic>> items = sr.items;
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: Styles.black,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                onItemTap(items[index]);
              },
              child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Styles.primaryColor,
                    Styles.blueGreyThemeColor
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      /*  Container(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Styles.secondaryBGColor,
                                backgroundImage: NetworkImage(
                                  items[index]["images"].toString(),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),*/
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]["Title"].toString(),
                            style: const TextStyle(
                                color: Styles.secondaryFontColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(items[index]["Description"].toString()),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  )),
            )));
  }

  BoxDecoration getItemBoxDecoration() {
    return BoxDecoration(
        color: Styles.white, border: Border.all(width: 1, color: Styles.black));
  }

  static Widget multi(UiFieldDef fieldDef, Map<String, dynamic> formData) {
    return MultiSelectDialogField(
        items: fieldDef.optionsList.map((e) => MultiSelectItem(e, e)).toList(),
        initialValue: formData[fieldDef.fieldName!],
        title: Text(fieldDef.hint!),
        listType: MultiSelectListType.CHIP,
        onConfirm: (values) {
          formData[fieldDef.fieldName!] = values;
        });
  }
}
