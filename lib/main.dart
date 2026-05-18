import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Data Pelanggan"),
          backgroundColor: Colors.teal,
        ),

        body: ListView(
          padding: const EdgeInsets.all(15),

          children: [
            const Text(
              "Form Input",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nomor HP",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Alamat",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Andi"),
              subtitle: Text("Pelanggan Aktif"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Budi"),
              subtitle: Text("Pelanggan Baru"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Citra"),
              subtitle: Text("Member Premium"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Dewi"),
              subtitle: Text("Pelanggan Aktif"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Eko"),
              subtitle: Text("Pelanggan Non Aktif"),
            ),
          ],
        ),
      ),
    );
  }
}
