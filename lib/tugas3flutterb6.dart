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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"title": "Hujan", "color": Colors.blue},
      {"title": "Cerah", "color": Colors.orange},
      {"title": "Mendung", "color": Colors.grey},
      {"title": "Petir", "color": Colors.purple},
      {"title": "Angin", "color": Colors.green},
      {"title": "Badai", "color": Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi & Katalog"),
        backgroundColor: Colors.blue,
      ),

      // SINGLECHILDSCROLLVIEW
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // JUDUL FORM
            const Text(
              "Form Registrasi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // TEXTFIELD 1
            TextField(
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // TEXTFIELD 2
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // TEXTFIELD 3
            TextField(
              decoration: InputDecoration(
                labelText: "No. HP",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // TEXTFIELD 4
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // JUDUL GRID
            const Text(
              "Galeri Cuaca",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // GRIDVIEW
            GridView.count(
              crossAxisCount: 2,

              // AGAR TIDAK CONFLICT SCROLL
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              children: items.map((item) {
                return Stack(
                  children: [
                    // CONTAINER WARNA
                    Container(
                      decoration: BoxDecoration(
                        color: item["color"],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    // OVERLAY TEXT
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        color: Colors.black54,
                        child: Text(
                          item["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
