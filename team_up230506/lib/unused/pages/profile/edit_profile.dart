import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';
import 'edit_details.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                      Text("Profile Picture",style: TextStyle(
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
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80"),
                  ),
                )
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
                      Text("Cover Photo",style: TextStyle(
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
                  child: Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                    height: 150,
                    width: double.infinity,),
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
                      Text("Bio",style: TextStyle(
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
                    child: Text("Nothing Worried about....")
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
                      Text("Details",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: SizedBox()),
                      MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>EditDetails()));
                        },
                        child: Text("Edit",style: TextStyle(
                            color: Styles.linkBlueColor
                        ),),

                      )
                    ],
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 10.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: optionlist.length,
                      itemBuilder: (context,index)=>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                Icon(optionlist[index].icon),
                                SizedBox(width: 20.0),
                                Text(optionlist[index].name.toString())
                              ],
                            ),
                          ),
                    )
                ),

              ],
            ),
          ),
        ],
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
  new OptionsList(icon: Icons.person,
      name: "Personal Info"),
  new OptionsList(icon: Icons.location_on_sharp,
      name: "Location"),
  new OptionsList(icon: Icons.star,
      name: "Hobbies"),
  new OptionsList(icon: Icons.reorder,
      name: "Achievements"),
  new OptionsList(icon: Icons.style,
      name: "Performances"),
];