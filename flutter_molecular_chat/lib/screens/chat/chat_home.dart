import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'const.dart';

class ChatHome extends StatefulWidget {
  final String userEmail;

  ChatHome(this.userEmail);

  @override
  State createState() => ChatHomeState();
}

class ChatHomeState extends State<ChatHome> {
  final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  bool isLoading = false;
  // List<Choice> choices = const <Choice>[
  //   const Choice(title: 'Settings', icon: Icons.settings),
  //   const Choice(title: 'Log out', icon: Icons.exit_to_app),
  // ];

  @override
  void initState() {
    super.initState();
    // registerNotification();
    // configLocalNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Home',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
       
        centerTitle: true,
      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            // List
            Container(
              child: StreamBuilder(
                stream: Firestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                      ),
                    );
                  } else {
                    print("snap sot ha***********************88data");
                    return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (context, index) =>
                          buildItem(context, snapshot.data.documents[index]),
                      itemCount: snapshot.data.documents.length,
                    );
                  }
                },
              ),
            ),

            // Loading
            Positioned(
              child: isLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(themeColor)),
                      ),
                      color: Colors.white.withOpacity(0.8),
                    )
                  : Container(),
            )
          ],
        ),
        //onWillPop: onBackPress,
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['username'] == widget.userEmail) {
      return Container();
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: Colors.black)),
                child: Text(
                  'UserName: ${document['username']}',
                  style: TextStyle(color: primaryColor),
                ),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chat(
                              peerId: document['username'],
                            )));
              },
            )
          ],
        ),
      );
    }
  }
}
