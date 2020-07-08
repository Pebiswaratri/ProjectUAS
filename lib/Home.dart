import 'package:example/widgets/loading.dart';
import 'package:flutter/material.dart';
//letak package folder flutter
import 'package:example/form.dart';
import 'package:example/mkontak.dart';
import 'package:example/database.dart';

//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron
import 'package:example/widgets/mydrawer.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  List<Note2> notes;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjualan Ocha Beauty'),
        backgroundColor: Colors.redAccent,
      ),


      body: loading? Loading() : ListView.builder(
        padding: EdgeInsets.all(5.0),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          Note2 note = notes[index];
          return Card(
            color: Colors.white70,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.bubble_chart),
              ),
              title: Text(note.barang),
              subtitle: Text(
                note.pembeli + '  | Rp. ' +note.harga,
                overflow: TextOverflow.ellipsis,
              ),

              onTap: () {
                setState(() => loading = true);
                Navigator.push(context, MaterialPageRoute(builder: (context) => EntryForm(note: note))).then((v) {
                  refresh();
                });
              },
            ),
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }


  Future<void> refresh() async {
    notes = await DB().getNotes();
    setState(() => loading = false);
  }

}