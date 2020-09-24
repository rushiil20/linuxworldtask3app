import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home chat'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.lightBlueAccent,
                elevation: 10,
                child: MaterialButton(
                  height: 40,
                  minWidth: 200,
                  child: Text('Registration'),
                  onPressed: () {
                    Navigator.pushNamed(context, "reg");
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.lightBlueAccent,
                elevation: 10,
                child: MaterialButton(
                  height: 40,
                  minWidth: 200,
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
