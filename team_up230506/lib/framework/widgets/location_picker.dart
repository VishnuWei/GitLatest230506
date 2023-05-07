import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../app-settings/Styles.dart';



class LocationPicker extends StatefulWidget {

  const LocationPicker({Key? key}) : super(key: key);

  @override
  LocationPickerState createState() => LocationPickerState();
}

class LocationPickerState extends State<LocationPicker> {
  final TextEditingController _controller = TextEditingController();

  String? location;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Future<void> GetAddressFromLatLong(Position position) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(placemarks);
  //   Placemark place = placemarks[0];
  //   Address = '${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(() {
  //     _controller.value = TextEditingValue(
  //         text: '${Address}',
  //         selection: TextSelection.fromPosition(
  //             TextPosition(offset: Address!.length)));
  //   });
  // }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      // Text('${Address}'),
      // ElevatedButton(onPressed: () async{
      //   Position position = await _getGeoLocationPosition();
      //   location ='Lat: ${position.latitude} , Long: ${position.longitude}';
      //   GetAddressFromLatLong(position);
      // }, child: Text('Get Location')),
      Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Styles.white,
              border: Border.all(
                width: 1,
                color: Styles.black,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Location',
                  contentPadding: EdgeInsets.all(10),
                  hintStyle: TextStyle(
                    color: Styles.black,
                    fontSize: 14.0,
                  )),
              onTap: () async {
                Position position = await _getGeoLocationPosition();
                location =
                    'Lat: ${position.latitude} , Long: ${position.longitude}';
      //        GetAddressFromLatLong(position);
              },
            ))
    ])),
        ));
  }
}
