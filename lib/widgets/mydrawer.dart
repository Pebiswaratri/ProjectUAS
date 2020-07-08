import 'package:example/dasbord.dart';
import 'package:flutter/material.dart';
import 'package:example/Home.dart';
import 'package:example/landing.dart';
import 'package:example/scan/scantoko.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.jpeg"),
                )
            ),
          ),
          new Container(
            height: 50,
          ),

          ListTile(
            leading: Icon(Icons.collections_bookmark),
            title: Text('Dashboard'),
            onTap: ()
            {

              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },

          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Catat'),
            onTap: ()
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new dasbord()));
            },
          ),

          ListTile(
            leading: Icon(Icons.youtube_searched_for),
            title: Text('Cek Produk'),
            onTap: ()
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            onTap: ()
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new LandingPage()));
            },
          ),
        ],
      ),
    );
  }
}