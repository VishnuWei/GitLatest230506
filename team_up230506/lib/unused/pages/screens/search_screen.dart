import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  final suggestionlist=[
    "Name",
    "Location",
    "Interest",
  ];
  final placelist=[
    'Kochi',
    "Calicut",
    "Chennai",
    "Bangalore",
    "Hyderabad",
    "Mumbai",
    "Newdelhi",
    "Kolkatha",
    "Ahmedabad",
    "Mangalore",
    "Pune",
    "Jaipur",
    "Surat"
  ];
  final suggestionlist1=[
    "Local",
    "District",
    "State",
    "National"
  ];
  TextEditingController _searchcontroller = TextEditingController();
  String dropdownValue='Calicut';
  RangeValues values = RangeValues(5,50);
  @override
  void dispose() {
    _searchcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
      ),
      body:  ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 12.0,left: 12.0,right: 12.0),
            child: Container(
              height: 58,
              child: InputDecorator(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      elevation: 10,
                      style: TextStyle(color: Styles.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: placelist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),
                    ),
                  )),
            ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12.0,left: 12.0,right: 12.0),
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 12.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchcontroller,
                      style: TextStyle(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search ",
                          suffixIcon: Icon(Icons.search),
                          hintStyle: TextStyle(fontSize: 16, color: Styles.primaryFontColor),
                          filled: true,
                          fillColor: Styles.white,
                          contentPadding:
                          EdgeInsets.only(left: 14, top: 14, bottom: 14),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:Styles.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:Styles.black))),
                    ),
                  ],
                ),
              ),
            ),
                Padding(
                padding: EdgeInsets.only(top: 20.0,left: 14.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Looking For:",style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                ),
            SizedBox(
              child:
              Padding(
                padding: const EdgeInsets.only(left:14.0,top: 12.0,right: 12.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 140,
                        mainAxisExtent: 40,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                    ),
                    shrinkWrap: true,
                    itemCount: suggestionlist.length,
                    itemBuilder: (context,index){
                      return Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              child: Center(child: Text(suggestionlist[index])),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Styles.black)
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                ),
              ),
            ),
                Padding(
                padding: EdgeInsets.only(top: 20.0,left: 14.0),
                  child: Container(
                    child: Column(
                        children: [
                    Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Age Range:",style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
    ]
                )
    ),
    ),
            SizedBox(
              child: Padding(
               padding: EdgeInsets.only(top: 16.0,left: 10.0),
               child: RangeSlider(
    values: values,
    min: 5,
    max: 50,
    divisions: 45,
    labels: RangeLabels(
    values.start.round().toString(),
    values.end.round().toString(),
    ),
    onChanged: (values)=>setState(()=>  this.values=values),

    ),
    ),

    ),
    Padding(
    padding: EdgeInsets.only(top: 14.0,left: 14.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Level:",style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,
              ))
            ],
          ),
        ),
    ),
            SizedBox(
              child: Padding(
            padding: EdgeInsets.only(top: 14.0,left: 14.0,right: 12.0),
              child:
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,
                      mainAxisExtent: 40,
                      childAspectRatio: 4 / 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 12
                  ),
                  shrinkWrap: true,
                  itemCount: suggestionlist1.length,
                  itemBuilder: (context,index){
                    return Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 90,
                            child: Center(child: Text(suggestionlist1[index])),
                            decoration: BoxDecoration(
                                border: Border.all(color: Styles.black)
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
              ),
            ),
              Padding(
              padding: EdgeInsets.only(top: 14.0,left: 14.0,right: 14.0),
              child:
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Styles.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Search",style: TextStyle(
                      color:Styles.secondaryFontColor
                  ),),
                ),
              ),
              ),
    ]
              ),
    );

  }
}

