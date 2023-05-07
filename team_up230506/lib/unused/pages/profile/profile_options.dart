import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';

class ProfileOption extends StatefulWidget {
  const ProfileOption({Key? key}) : super(key: key);

  @override
  _ProfileOptionState createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Styles.titleFontColor
          ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Styles.appBarIconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Styles.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: optionlist.length,
                  itemBuilder: (context, index) =>
                      Container(
                          height:50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            elevation: 1,
                            color: Styles.white,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(optionlist[index].icon),
                                        SizedBox(width: 20),
                                        Text(
                                          optionlist[index].name.toString(),
                                          style: TextStyle(
                                              color: Styles.primaryFontColor,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class OptionsList{
  IconData? icon;
  String? name;

  OptionsList({this.name,this.icon});
}
List< OptionsList>optionlist=[
  new OptionsList(icon: Icons.local_activity,
      name: "Activities"),
  new OptionsList(icon: Icons.lock,
      name: "Lock Profile"),
  new OptionsList(icon: Icons.search,
      name: "Search"),
  new OptionsList(icon: Icons.security,
      name: "Security"),
  new OptionsList(icon: Icons.privacy_tip,
      name: "Privacy policy"),
  new OptionsList(icon: Icons.help,
      name: "Help"),
];