import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          color: Styles.primaryColor,
          height: 180,
          child: Column(children: [
            Align(
              alignment: FractionalOffset.topCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Styles.appBarIconColor,
                      ),
                      Text(
                        "_username",
                        style: TextStyle(
                            color: Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        color: Styles.appBarIconColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.network(
                        "https://loveshayariimages.in/wp-content/uploads/2021/07/a-latter-Whatsapp-Dp-Profile-Images-pics-photo-hd.jpg"),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      Text(
                        "245",
                        style: TextStyle(
                            color: Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Post",
                        style: TextStyle(
                            color: Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.0),
                  Column(
                    children: [
                      Text(
                        "350",
                        style: TextStyle(
                            color: Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Likes",
                        style: TextStyle(
                            color:Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.0),
                  Column(
                    children: [
                      Text(
                        "452",
                        style: TextStyle(
                            color:Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Followers",
                        style: TextStyle(
                            color: Styles.titleFontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
        SizedBox(
          height: 450,
          child: Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 6.5 / 10.0,
                  crossAxisCount: 2,
                ),
                itemCount: 12,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Ink.image(
                              image: NetworkImage(
                                  "https://i0.wp.com/www.tricksbystg.org/wp-content/uploads/2018/02/19-love-photos.jpg?resize=640%2C585"),
                              child: InkWell(
                                onTap: () {},
                              ),
                              height: 226,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
