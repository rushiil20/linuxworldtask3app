import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  var url =
      "https://console.firebase.google.com/u/0/project/flutterchatapp-c14b4/firestore/data~2Fstudents~2Fopv64rrrRCEsqfOz0jme";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'could not find the url';
  }
}

class MyHome extends StatelessWidget {
  var url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "getdata");
              },
              color: Colors.red,
              textColor: Colors.white,
              hoverColor: Colors.white,
              child: Text("Write the commands"),
            ),
            RaisedButton(
              onPressed: () {
                launchURL();
              },
              color: Colors.red,
              textColor: Colors.white,
              hoverColor: Colors.redAccent,
              child: Text("Show the all commands"),
            ),
          ],
        ),
      ),
    );
  }
}
