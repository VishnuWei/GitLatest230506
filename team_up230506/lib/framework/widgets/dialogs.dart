import 'package:flutter/material.dart';




enum AlertType {
  error,
  success,
  warning,
  info
}


class Dialogs {


  static void showLoadingIndicator(context, AlertType alertType, String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog( content:  CircularProgressIndicator() );
      },
    );
  }

  static CircularProgressIndicator getLoadingIndicator() {
    return const CircularProgressIndicator();
  }
    static void showCloseableDialog(context, AlertType alertType, String title, String content) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                TextButton (
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
    }

    static dismiss(BuildContext context) {
      // Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    }
  }



/*
class VFuelAlertView extends StatelessWidget {
  final AlertType? alertType;
  final String? cancelButtonText, okButtonText, message, title;
  final Function? okButtonCallBack, cancelButtonCallBack;
  final BuildContext? alertContext;
  final Color? color;
  const VFuelAlertView(
      {Key? key,
        this.alertType,
        this.cancelButtonText = null,
        this.okButtonText,
        this.message,
        this.title,
        this.okButtonCallBack,
        this.cancelButtonCallBack,
        this.alertContext,
        this.color})
      : super(key: key);


  onCancel(){
    Navigator.pop(alertContext!);
    cancelButtonCallBack!();
  }
  onOk(){
    Navigator.pop(alertContext!);
    okButtonCallBack!();
  }
  @override
   Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(15),
          color: Styles.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 65,
                  width: 65,
                  child: Center(
                    child: imageName(),
                  ),
                  decoration: BoxDecoration(
                      color: imageBgColor(), shape: BoxShape.circle)),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (cancelButtonText != null)
                            Expanded(child: WidgetFactory.getInkWellButton(cancelButtonText!, onCancel() )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: WidgetFactory.getInkWellButton(okButtonText!, onCancel() ))
                        ],
                      )))
            ],
          ),
        ));
  }

  Icon? imageName() {
    var icon;
    switch (alertType!) {
      case AlertType.error:
        icon = Icon(
          Icons.close,
          // color: teamuplStyles.ErrorIconColor,
        );
        break;
      case AlertType.success:
        icon = Icon(
          Icons.check,
          // color: teamuplStyles.SuccessIconColor,
        );
        break;
      case AlertType.warning:
        icon = Icon(
          Icons.error_outline,
          // color: teamuplStyles.ErrorIconColor,
        );
        break;
    }
    return icon;
  }

  Color? imageBgColor() {
    var color;
    switch (alertType!) {
      case AlertType.error:
      // color = teamuplStyles.ErrorAlertImageBGColor;
        break;
      case AlertType.success:
      // color = teamuplStyles.SuccessAlertImageBGColor;
        break;
      case AlertType.warning:
      // color = teamuplStyles.ErrorAlertImageBGColor;
        break;
    }
    return color;
  }

  Color? iconColor() {
    var color;
    switch (alertType!) {
      case AlertType.error:
      // color = teamuplStyles.ErrorIconColor;
        break;
      case AlertType.success:
      // color = teamuplStyles.SuccessIconColor;
        break;
      case AlertType.warning:
      // color = teamuplStyles.ErrorIconColor;
        break;
    }
    return color;
  }
}
*/