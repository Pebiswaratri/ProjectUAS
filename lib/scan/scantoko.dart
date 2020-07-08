import 'package:example/scan/webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scann Produk"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            child: new Image.asset(
              "assets/scan.jpeg",
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              height: 70,
              width: 70,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Tapp",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebScreen(kode),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                    "kode produk",
                    style: TextStyle(
                      color: Colors.black26,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  )
                      : Text(
                    kode,
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
