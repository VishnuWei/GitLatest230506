import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';

class AddNewTeam extends StatefulWidget {
  const AddNewTeam({Key? key}) : super(key: key);

  @override
  _AddNewTeamState createState() => _AddNewTeamState();
}

class _AddNewTeamState extends State<AddNewTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Styles.appBarIconColor,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Styles.primaryColor,
      ),
      body: Stack(
        children: [
          ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:teamlist.length,
          itemBuilder: (context, index)=>
              Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Styles.black,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                        height: 100,
                        decoration:BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Styles.primaryColor,Styles.blueGreyThemeColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            )
                        ),
                        padding: EdgeInsets.all(20),
                        child:Row(
                          children: [
                            Container(
                              child:CircleAvatar(
                                radius: 30,
                                backgroundColor: Styles.secondaryBGColor,
                                backgroundImage: NetworkImage(teamlist[index].images.toString(),),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    teamlist[index].name.toString(),
                                    style: TextStyle(color: Styles.secondaryFontColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  )
                                ]
                              )
                            )
                          ]
                        )
                    )
                  )
              )
      ),
          Align(
            alignment:FractionalOffset.topCenter ,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width-20,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: BorderSide(
                        color: Styles.primaryColor
                    )
                ),
                child: TextFormField(
                  decoration:InputDecoration(
                    hintText: "Search here",
                    contentPadding: EdgeInsets.all(4.0),
                    suffixIcon: Icon(Icons.search),
                  ),
                  onTap: (){
                    showSearch(context: context, delegate: SearchView());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
showAlertDialog(BuildContext context) {

  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.pop(context);
    }
  );
  Widget continueButton = TextButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.pop(context);
    }
  );

  AlertDialog alert = AlertDialog(
    title: Text("Are you sure?"),
    content: Text("Are you sure you want to add this team to your event?"),
    actions: [
      cancelButton,
      continueButton
    ]
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    }
  );
}
class SearchView extends SearchDelegate<String>{
  final _recentnames =[
    "Team Soccers",
    "Riders club",
    "Cricket Live",
  ];
  final _names=[
    "Something",
    "Jockers",
    "Villians",
    "Funny Guyz",
    "Music Band"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed:(){
        query="";
      }, icon:Icon(Icons.clear))
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed:(){
      close(context, null.toString());
    },
        icon: AnimatedIcon(
      icon:AnimatedIcons.menu_arrow,
      progress:transitionAnimation
    )
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(query),
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList= query.isEmpty?_recentnames:
    _names.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context,index)=> ListTile(
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,);
  }

}
class TeamList{
  String? images;
  String? name;
  String? status;

  TeamList({this.images,this.name, this.status,});

}
List<TeamList>teamlist=[
  new TeamList(images: "https://images.pexels.com/photos/949592/pexels-photo-949592.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      name: "Rockers",status: "Lets Rock.....!!!"),
  new TeamList(images: "https://images.news18.com/ibnlive/uploads/2021/08/football.jpg",
      name: "TeamSoccers",status: "Football team Wayanad"),
  new TeamList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeo2zYq5gmJypgbwzSlDHxcZqNQGBi5ikhxA&usqp=CAU",
      name: "Music Band",status: "Music uyir...%%%%%^^"),
  new TeamList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRflVOel9tezp8r6EXq61-rBlv_wuZxdoCzKQ&usqp=CAU",
      name: "Get together",status: "After a long time....."),
  new TeamList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuionojO8Eg8xA3cEzeO8J-JEcTcEY8-SHw&usqp=CAU",
      name: "Freshers",status: "Lets develope something"),
  new TeamList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR94-zdiyrwzLo0mBxsZkVACWA2S9pbiYAgjg&usqp=CAU",
      name: "Riders club",status: "Explore the world"),
  new TeamList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7r1CClpi96ZLxb9kKpStUyPIsYsZYw_5l2Q&usqp=CAU",
      name: "Arts Club",status: "Arts&sports club Calicut"),
  new TeamList(images: "https://st2.depositphotos.com/2778793/6947/i/600/depositphotos_69473793-stock-photo-abstract-cricket-player-in-beautiful.jpg",
      name: "Cricket Live",status: "Cric Lover's ......"),
];
