import 'package:flutter/material.dart';

void main() {
  runApp(const chronicles());
}

//widget utama aplikasi
class chronicles extends StatelessWidget {
  const chronicles({super.key});


  //Halaman Profil
@override
Widget build(BuildContext context)  {
return MaterialApp(
home: Scaffold(
appBar: AppBar(
backgroundColor: Colors.red,
centerTitle: true,
title: Text("Profil Saya",
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),
body: Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
   //Nama
    Text("Nama : Mohamad Fahri"),
    
    Text("📍Jakarta"),
    Text("Peserta Pelatihan PPKD"),
    ],
), // Column
), // Center
), // Scaffold
); // MaterialApp
} // build
} // class











