import 'package:flutter/material.dart';

import 'data/list.dart';
import 'models/model.dart';

class Tugas9Flutter extends StatefulWidget {
  const Tugas9Flutter({super.key});

  @override
  State<Tugas9Flutter> createState() => _Tugas9FlutterState();
}

class _Tugas9FlutterState extends State<Tugas9Flutter> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Food Rescue',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.green.shade700,
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Kategori'),
              Tab(icon: Icon(Icons.map), text: 'Mitra'),
              Tab(icon: Icon(Icons.layers), text: 'Paket Donasi'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // TUGAS 1. LIST (SUDAH DIUBAH MENJADI LIST KEBAWAH)
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: kategoriMakanan.length,
              itemBuilder: (BuildContext context, int index) {
                final data = kategoriMakanan[index];
                return ListTile(
                  // Menampilkan nomor di bagian depan (kiri)
                  leading: Text(
                    '${index + 1}.',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Menampilkan teks kategori di sebelah nomor
                  title: Text(
                    data,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Memberikan garis pembatas tipis antar list (opsional)
                  dense: true,
                );
              },
            ),

            // TUGAS 2. LIST OF MAP
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: daftarMitra.length,
              itemBuilder: (BuildContext context, int index) {
                final data = daftarMitra[index];
                return Container(
                  color: index % 2 == 0 ? Colors.blue : Colors.red,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        data['icon'] as IconData,
                        size: 36,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data['nama'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        data['lokasi'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Jarak: ${data['jarak']}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // TUGAS 3. MODEL
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: daftarDonasi.length,
              itemBuilder: (BuildContext context, int index) {
                final data = daftarDonasi[index];
                return Container(
                  color: index % 2 == 0 ? Colors.blue : Colors.red,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.judul,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.deskripsi,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${data.porsi} Porsi',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
