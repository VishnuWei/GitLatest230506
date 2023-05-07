import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';


import '../app-settings/UiTexts.dart';
import '../app-settings/api_endpoints.dart';
import '../app-settings/app-json-ui.dart';
import '../app-settings/app_router.dart';
import '../cubit/server-request/ServerRequest_cubit.dart';
import '../framework/models/ApiResponseBase.dart';
import '../framework/shared_preference_manager.dart';
import '../framework/widgets/dialogs.dart';
import '../framework/widgets/widget-factory.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _key = GlobalKey();
  late ServerRequestCubit<ApiResponseBase> cubit;
  String googleApikey = "AIzaSyBEOIIRPeGnc7mm3CYfLTDqtCiRCv2mahU";
  GoogleMapController? mapController; //controller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(27.6602292, 85.308027);
  String location = "Search Location";


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
             //    Dialogs.showLoadingIndicator(context, AlertType.info, "Loading");
              }
              if (state is RequestSuccess) {
                SharedPreferenceManager.setValue("session", state.apiResponse);
                AppRouter.navigate(context, AppScreen.home, true);
              }
              else if (state is RequestFailed) {
                Dialogs.dismiss(context);
                Dialogs.showCloseableDialog(context, AlertType.error, "Signup Failed", state.message);
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
     return SafeArea(
      child: ListView(
        children: <Widget>[
          Container( padding: WidgetFactory.largeLogoEdgeInserts,  child: WidgetFactory.getLogo("Team\nUp!")),
          Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.signup, formData, context) ),
          Container( padding: WidgetFactory.buttonEdgeInserts, child: WidgetFactory.getInkWellButton(UiTexts.signup, onSignupTap)),
          const SizedBox( height: 40.0, ),
          Row(
                  children: <Widget>[
                  WidgetFactory.getInkWellTextPageNavigator(UiTexts.signin,onSigninTap),
                ],
              ),
        ],
      ),
    );
  }



    void  onSigninTap(String text) {
      AppRouter.navigate(context, AppScreen.signin, true);
    }

    void  onSignupTap(String text)
    {
        cubit.loadRequest( APIEndPoints.signup, "", formData,  authRequired : false);
    }
 }