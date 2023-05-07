  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app-settings/UiTexts.dart';
import '../app-settings/api_endpoints.dart';
import '../app-settings/app-json-ui.dart';
import '../app-settings/app_router.dart';
import '../cubit/server-request/ServerRequest_cubit.dart';
import '../framework/shared_preference_manager.dart';
import '../framework/widgets/dialogs.dart';
import '../framework/widgets/widget-factory.dart';


  class SigninForm extends StatefulWidget {
    const SigninForm({Key? key}) : super(key: key);
    @override
    SigninFormState createState() => SigninFormState();
  }

  class SigninFormState extends State<SigninForm> {

    final GlobalKey<FormState> _key = GlobalKey();
    late ServerRequestCubit cubit;

    Map<String, dynamic> formData = <String, dynamic>{} ;


    @override
    void initState() {
      cubit = ServerRequestCubit();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: BlocProvider(
            create: (context) => cubit,
            child: BlocListener<ServerRequestCubit, ServerRequestState>(
              bloc: cubit,
              listener: (context, state) {
                if (state is LoadingRequest) {
                  // Dialogs.showLoadingIndicator(context, AlertType.info, "");
                }
                if (state is RequestSuccess) {
                  SharedPreferenceManager.setValue("session", state.apiResponse);
                  AppRouter.navigate(context, AppScreen.home, true);
                }
                else if (state is RequestFailed) {
                  Dialogs.dismiss(context);
                  Dialogs.showCloseableDialog(context, AlertType.error, "Signin Failed", state.message);
                }
              },
              child:
              BlocBuilder<ServerRequestCubit, ServerRequestState>(builder: (context, state) {
                return Form(key: _key, child: getUiSafeArea());
              }),
            )),
      );
    }

    Widget getUiSafeArea() {
      return  SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(22.0),
          children: <Widget>[
            Container( padding: WidgetFactory.largeLogoEdgeInserts,  child: WidgetFactory.getLogo("Team\nUp !")),
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.signin, formData, context) ),
            Container( padding: WidgetFactory.buttonEdgeInserts, child: WidgetFactory.getInkWellButton(UiTexts.signin, onSigninTap)),
            const SizedBox( height: 40.0, ),
            Row(
              children: <Widget>[
                WidgetFactory.getInkWellTextPageNavigator(UiTexts.signup,onSignupTap),
              ],
            ),
          ],
        ),
      );
    }

    void  onSigninTap(String text) {
      cubit.loadRequest( APIEndPoints.signin, "", formData,  authRequired : true);
      AppRouter.navigate(context, AppScreen.home, true);
    }


    void  onSignupTap(String text) {
      AppRouter.navigate(context, AppScreen.signup, true);
    }

  }

