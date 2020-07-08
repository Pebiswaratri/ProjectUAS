class Note2 {

  int id, date;
  String barang, pembeli, harga;

  setDate() {
    DateTime now = DateTime.now();
    String ds = now.year.toString() + now.month.toString() + now.day.toString() + now.hour.toString() + now.minute.toString() + now.second.toString();
    date = int.parse(ds);
  }

  Note2();

  Note2.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    date = map['date'];
    barang = map['barang'];
    pembeli = map['pembeli'];
    harga=map['harga'];
  }

  toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'barang': barang,
      'pembeli': pembeli,
      'harga' : harga
    };
  }

}