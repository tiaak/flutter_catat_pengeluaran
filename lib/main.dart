// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false, //menghilangkan debug banner
        home: Scaffold(
            body: Container(
          //pakai column, karena ada dua bagian (header dan summary)
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                //sesuai aturan STACK
                backgroundHeader(),
                searchMenu(),
                summaryCash()
              ],
            ),

            // Bagian ini akan menampilkan history pengeluaran
            cardDetail('Makan Siang', 'Beli Makan di Warteg', '10.000', 'out'),
            cardDetail('Bonus', 'Dapat Bonus Proyek', '500.000', 'in'),
            cardDetail('Beli Baju', 'Baju Kemeja Kantor', '25.000', 'out'),
          ]),
        )));
  }
}

Widget cardDetail(title, description, price, type) {
  //Card history untuk penjualan
  return Card(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    elevation: 8,
    child: ListTile(
      leading: Icon(
        type == 'out'
            ? Icons.subdirectory_arrow_left
            : Icons.subdirectory_arrow_right,
        color: type == 'out' ? Colors.redAccent : Colors.lightGreen,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
      trailing: Text(
        "Rp " + price,
        style: TextStyle(
            color: type == 'out' ? Colors.redAccent : Colors.lightGreen),
      ),
    ),
  );
}

Widget summaryCash() {
  //Container untuk summary pengeluaran dan pemasukan
  // POSITIONED digunakan karena widget ini akan diperlakukan sebagai STACK, supaya posisinya dapat diset sedemikian rupa
  return Positioned(
    top: 200, // jarak dihitung dari bagian teratas
    left: 20,
    child: Container(
      width: 370,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text("Penghasilan"),
                  Divider(),
                  Text(
                    "Rp1.500.000",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text("Pengeluaran"),
                  Divider(),
                  Text(
                    "Rp260.000",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]),
      ),
    ),
  );
}

Widget searchMenu() {
  return Positioned(
      top: 130,
      left: 18,
      child: Container(
        width: 370,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.5, left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Text(
                'Cari disini',
                style: TextStyle(
                    color: Colors.black38,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Icon(
                Icons.search,
                color: Colors.black38,
              )
            ],
          ),
        ),
      ));
}

Widget backgroundHeader() {
  //container untuk header
  //KITA BUAT CONTAINER DENGAN TINGGI SEBESAR 300, DAN LEBAR SEJAUH YANG BISA DIJANGKAU
  //BOXDECORATIONNYA KITA SET WARNANYA PINK ACCENT DAN PADA BAGIAN BAWAH KIRI-KANAN DIBUAT LENGKUNGAN
  return Container(
    height: 350,
    width: double.infinity, //lebar sesuai ukuran layar
    //DECORATION UNTUK MENGATUR STYLE CONTAINER
    decoration: BoxDecoration(
      // color: Colors.pinkAccent,
      // makai gradient warna untuk background
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // ignore: prefer_const_literals_to_create_immutables
        colors: [Colors.pinkAccent, Colors.deepPurple],
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    //ANAK CONTAINER
    child: Padding(
      padding: const EdgeInsets.only(top: 60, left: 25),
      child: Column(
        //mengatur posisi widget, secara vertikal, START = mulai dari atas widget parent
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Text(
                "Tiaak",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "0812622994576",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
