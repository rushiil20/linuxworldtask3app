import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Myget extends StatefulWidget {
  @override
  _MygetState createState() => _MygetState();
}

class _MygetState extends State<Myget> {
  var cmd;
  var webdata;

  myweb(cmd) async {
    var url = "http:/10.0.2.15/cgi-bin/web.py/x=${cmd}";
    var r = await http.get(url);

    setState(() {
      webdata = r.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cmd page"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              cmd = value;
            },
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () async {
              await myweb(cmd);
              var fsconnect = FirebaseFirestore.instance;
              fsconnect.collection("linux cmd").add({
                "command line": cmd,
                "output": webdata,
              });
            },
          ),
        ],
      ),
    );
  }
}
