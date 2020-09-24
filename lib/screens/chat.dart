import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Mychat extends StatefulWidget {
  @override
  _MychatState createState() => _MychatState();
}

class _MychatState extends State<Mychat> {
  @override
  void initState() {
    print("landed to chat");
    print("done");
    super.initState();
  }

  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat Page'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                print("Signout");
                await auth.signOut();
                Navigator.pushNamed(context, "login");
              }),
        ],
      ),
      body: RaisedButton(
        onPressed: () {
          try {
            var user = auth.currentUser;
            print(user.email);
          } catch (e) {
            print(e);
          }
        },
        child: Text('click to know u r'),
      ),
    );
  }
}
