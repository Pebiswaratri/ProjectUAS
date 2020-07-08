import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  _logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('slogin', false);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
  _notlogOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('slogin', false);
    Navigator.pop(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: new Container(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Anda Yakin Keluar ? '),
                  RaisedButton(
                    onPressed: () => _logOut(),
                    color: Colors.white,
                    child: const Text('Ya',
                        style: TextStyle(fontSize: 18)),
                  ),
                  RaisedButton(
                    onPressed: () => _notlogOut(),
                    color: Colors.white,
                    child: const Text('Tidak',
                        style: TextStyle(fontSize: 18)),
                  )
                ]
            ),


          )),
    ));
  }
}
