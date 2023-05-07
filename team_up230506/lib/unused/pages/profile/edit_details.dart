import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../app-settings/Styles.dart';
class EditDetails extends StatefulWidget {
  const EditDetails({Key? key}) : super(key: key);

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  var locationMessage = "";
  void getCurrentLocation()async{
    var position= await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    print("$lat , $long");
    setState(() {
      locationMessage = "$position";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",
          style: TextStyle(
              fontSize: 18,
              color: Styles.titleFontColor
          ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Styles.appBarIconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:Styles.primaryColor,
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Personal Info",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: SizedBox()),
                      MaterialButton(
                        onPressed: (){
                        },
                        child: Text("Edit",style: TextStyle(
                            color: Styles.linkBlueColor
                        ),),

                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("")
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Location",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: SizedBox()),
                      MaterialButton(
                        onPressed: (){
                          getCurrentLocation();
                        },
                        child: Text("Edit",style: TextStyle(
                            color: Styles.linkBlueColor
                        ),),

                      )
                    ],
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                        onPressed: (){
                        },
                        child: Text("$locationMessage",
                          style: TextStyle(
                              color: Styles.linkBlueColor
                          ),
                        ))
                ),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hobbies",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: SizedBox()),
                      MaterialButton(
                        onPressed: (){
                        },
                        child: Text("Edit",style: TextStyle(
                            color: Styles.linkBlueColor
                        ),),

                      )
                    ],
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("")
                ),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Achievements ",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: SizedBox()),
                      MaterialButton(
                        onPressed: (){
                        },
                        child: Text("Edit",style: TextStyle(
                            color: Styles.linkBlueColor
                        ))

                      )
                    ]
                  )
                ),

                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("")
                ),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Performances ",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: SizedBox()),
                      MaterialButton(
                        onPressed: (){
                        },
                        child: Text("Edit",style: TextStyle(
                            color: Styles.linkBlueColor
                        ),),

                      )
                    ],
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("")
                )
              ]
            )
          )
        ]
      )
    );
  }
}
