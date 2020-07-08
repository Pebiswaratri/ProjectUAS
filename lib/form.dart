import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/mkontak.dart';
import 'package:example/database.dart';
import 'package:example/widgets/loading.dart';

class EntryForm extends StatefulWidget {
  final Note2 note;
  EntryForm({ this.note });


  @override
  EntryFormState createState() => EntryFormState();
}
//class controller
class EntryFormState extends State<EntryForm> {
  TextEditingController barang, pembeli,harga;
  bool loading = false, editmode = false;
  @override
  void initState() {
    super.initState();
    barang = new TextEditingController();
    pembeli = new TextEditingController();
    harga= new TextEditingController();
    if(widget.note.id != null) {
      editmode = true;
      barang.text = widget.note.barang;
      pembeli.text = widget.note.pembeli;
      harga.text=widget.note.harga;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editmode? 'Edit Data' : 'Tambah Data'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() => loading = true);
              save();
            },
          ),
          if(editmode) IconButton(
            icon: Icon(Icons.delete, color: Colors.red,),
            onPressed: () {
              setState(() => loading = true);
              delete();
            },
          ),
        ],
      ),
      body: loading? Loading() : ListView(
        padding: EdgeInsets.all(13.0),
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
              controller: barang,
            decoration: InputDecoration(
              labelText: 'Nama Barang',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
            ),


          ),
          SizedBox(height: 10.0),
          TextField(
            keyboardType: TextInputType.text,
            controller: pembeli,
            decoration: InputDecoration(
                labelText: 'Nama Pembeli',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            ),


          ),
          SizedBox(height: 10.0),
          TextField(
            keyboardType: TextInputType.number,
            controller: harga,
            decoration: InputDecoration(
                labelText: 'Harga',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            ),

          ),
        ],
      ),
    );
  }


  Future<void> save() async {
    if(barang.text != '') {
      widget.note.barang = barang.text;
      widget.note.pembeli = pembeli.text;
      widget.note.harga = harga.text;
      if(editmode) await DB().update(widget.note);
      else await DB().add(widget.note);
    }
    setState(() => loading = false);
  }

  Future<void> delete() async {
    await DB().delete(widget.note);
    Navigator.pop(context);
  }
}