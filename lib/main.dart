import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

web() async {
  var url = "http://10.0.2.15/cgi-bin/web.py?x=date";
  var r = await http.get(url);
  // var sc = r.statusCode;
  var dat = r.body;
  return dat;
  // print(data);
}

/*mybody() {
  return Column(
    children: <Widget>[
      RaisedButton(
        onPressed: web,
        child: Text('click for linux cmd'),
      ),
    ],
  );
}*/

class MyApp extends StatelessWidget {
  var fsconnect = FirebaseFirestore.instance;

  myget() async {
    var d = await fsconnect.collection("students").get();

    for (var i in d.docs) {
      print(i.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('mobile app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("send data"),
              onPressed: () {
                fsconnect.collection("students").add(
                      web(),
                    );
                print("send....");
              },
            ),
            RaisedButton(
              child: Text('get data'),
              onPressed: () {
                myget();
                print("get data . . .");
              },
            ),
          ],
        ),
      ),
    );
  }
}
