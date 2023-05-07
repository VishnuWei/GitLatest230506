import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';

class AddNewMember extends StatefulWidget {
  const AddNewMember({Key? key}) : super(key: key);

  @override
  _AddNewMemberState createState() => _AddNewMemberState();
}

class _AddNewMemberState extends State<AddNewMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Styles.appBarIconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Styles.primaryColor,
      ),
      body: Stack(
        children: [
      ListView.builder(
      scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:peopleslist.length,
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>showAlertDialog(context)));
                    },
                    child: Container(
                        height: 120,
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
                                backgroundImage: NetworkImage(peopleslist[index].images.toString()),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    peopleslist[index].name.toString(),
                                    style: TextStyle(color: Styles.secondaryFontColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    peopleslist[index].status.toString(),
                                    style: TextStyle(color: Styles.secondaryFontColor),
                                  ),
                                  SizedBox(
                                    height: 10,
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
                  }
                )
              )
            )
          )
        ]
      )
    );
  }
}
showAlertDialog(BuildContext context) {

  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        AddNewMember()));
    }
  );
  Widget continueButton = TextButton(
    child: Text("Ok"),
    onPressed:  () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Are you sure?"),
    content: Text("Are you sure you want to add this man on your team"),
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
    "Maria paul",
    "Christopher",
    "Angelina",
  ];
  final _names=[
        "Arthur"
        "Mia"
        "Freddie"
        "Willow"
        "Harry"
        "Evie"
        "Charlie"
        "Lilly"
        "Jack"
        "Grace"
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
    }, icon: AnimatedIcon(
      icon:AnimatedIcons.menu_arrow,
      progress:transitionAnimation ,
    )
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(query),
      )
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList= query.isEmpty?_recentnames:
    _names.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context,index)=> ListTile(
        leading: Icon(Icons.person),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,);
  }
}

class PeopleViewList {
  String? images;
  String? name;
  String? status;
  String? popularity;
  String? likes;
  String? followers;

  PeopleViewList({this.images,this.name, this.status, this.popularity, this.likes,
    this.followers});
}

List<PeopleViewList> peopleslist=[
  PeopleViewList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKAz_nFmUeG3udS_kOXxTQ0e4STV5RA2O4Vn6B5uVUT1U9s-U3HyaZTZ7WlmGMcM_Itas&usqp=CAU",
      name:"Maria paul",status:"Life is like a melody",popularity:"654",likes:"1235",followers:"849"),
  PeopleViewList(images: "https://content.api.news/v3/images/bin/83839a4f31763c4f1a61d3574cfdd800?width=650",
      name: "Christopher",status: "Run the race of Ur life",popularity: "631",likes: "1124",followers: "812"),
  PeopleViewList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKAz_nFmUeG3udS_kOXxTQ0e4STV5RA2O4Vn6B5uVUT1U9s-U3HyaZTZ7WlmGMcM_Itas&usqp=CAU",
      name:"Angelina",status:" Love takes a lot of work",popularity:"1054",likes:"751",followers:"762"),
  PeopleViewList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROLtbs6WfrgLT5AFtmgcZoPb4yJ6vq22cYi_ep71agNq8ouxh-k1PbfLOo90pk19tH6wE&usqp=CAU",
      name:"Dawyne johnson",status:"Football is like life. ...",popularity:"615",likes:"951",followers:"632"),
  PeopleViewList(images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXb40PuyalUX7A77PYNP53pUlOgjYsrbCA1Q&usqp=CAU",
      name:"Ayisha qathoon",status:"Be passionate",popularity:"545",likes:"911",followers:"492"),
  PeopleViewList(images: "https://content.api.news/v3/images/bin/83839a4f31763c4f1a61d3574cfdd800?width=650",
      name: "Mujthaba Naseeh",status: "Do whatever you want",popularity: "512",likes: "881",followers: "912")
];
