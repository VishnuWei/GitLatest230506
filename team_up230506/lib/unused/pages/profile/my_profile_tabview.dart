import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';
import '../../../framework/widgets/pick_image.dart';


class ProfileTabView extends StatefulWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {

  final double coverHeight = 140;
  final double profileHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            buildTop(),
            buildContent()
          ],
        )
    );
  }
  Widget buildTop(){
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children:[
          Container(
            height: 140,
              margin: EdgeInsets.only(bottom: 50),
              child: buildCoverImage()),
          Positioned(
            right: 20,
              bottom: 30,
              child: ChangeImage()),
          Positioned(
              top: 90,
              child: buildProfileImage()),
          Positioned(
            right: 100,
            top: 150,
              child: ChangeImage())
        ]
    );
  }
  Widget buildCoverImage()=>Container(
    color: Styles.secondaryBGColor,
      child: Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        width:MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
  );
  Widget buildProfileImage()=>CircleAvatar(
    radius: 50,
    backgroundColor: Styles.secondaryBGColor,
    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80"),
  );
  Widget buildContent()=>Column(
    children: [
      SizedBox(
        height: 8.0,
      ),
      Text("James Cameroon",style: TextStyle(
          fontSize: 20 ,fontWeight: FontWeight.bold
      ),),
      Center(
        child: Text("Nothing worried about....",style: TextStyle(
            fontSize: 14,color: Styles.black
        ),),
      ),
      SizedBox(height: 12.0 ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          NumberWidget(),
          SizedBox(height: 16),
          Divider(),
        ],
      ),
      SizedBox(height: 10.0),
      ButtonWidget(),
      SizedBox(height: 10.0,),
      SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: aboutlist.length,
              itemBuilder: (context, index) =>
                  Container(
                      height:50,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        elevation: 2,
                        color: Styles.white,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 70.0),
                                child: Row(
                                  children: [
                                    Icon(aboutlist[index].icon,
                                    color: Styles.primaryColor,
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      aboutlist[index].name.toString(),
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
          ],
        ),
      )
    ],
  );
}

class NumberWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context)=> Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildButton(text: "Posts",value: 42),
      buildButton(text: "Followers",value: 562),
      buildButton(text: "Following",value: 465),
    ],
  );
  Widget buildDivider()=>Container(
    height: 24,
    child: VerticalDivider(),
  );
  Widget buildButton({
    required String text,
    required int value,
  })=>
      MaterialButton(
        onPressed: (){},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("$value",
              style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 2),
            Text(text,
              style: TextStyle(
                  fontSize: 14
              ),
            )
          ],
        ),
      );
}
class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      );
}
Widget ChangeImage()=>
    SizedBox(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        backgroundColor: Styles.primaryBGColor,
        onPressed: (){
          PickImageDevice();
        },
        child: Icon(Icons.camera_alt,
        color: Styles.blackIconColor,
        ),
      ),
    );
class AboutList{
  IconData? icon;
  String? name;

  AboutList({this.name,this.icon});
}
List< AboutList>aboutlist=[
  new AboutList(icon: Icons.person,
      name: "Personal info"),
  new AboutList(icon: Icons.location_on_sharp,
      name: "Location"),
  new AboutList(icon: Icons.star,
      name: "Hobbies"),
  new AboutList(icon: Icons.reorder,
      name: "Achievements"),
  new AboutList(icon: Icons.style,
      name: "Performances"),
];