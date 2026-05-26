import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Level2Page(),
    );
  }
}

/// HALAMAN LEVEL 2
class Level2Page extends StatelessWidget {
  const Level2Page({super.key});

  /// LIST MAP
  final List<Map<String, dynamic>> kategoriFoodRescue = const [
    {"nama": "Buah Rescue", "icon": Icons.apple},

    {"nama": "Sayur Rescue", "icon": Icons.eco},

    {"nama": "Roti Berlebih", "icon": Icons.breakfast_dining},

    {"nama": "Minuman", "icon": Icons.local_drink},

    {"nama": "Frozen Food", "icon": Icons.ac_unit},

    {"nama": "Snack Rescue", "icon": Icons.cookie},

    {"nama": "Paket Donasi", "icon": Icons.favorite},

    {"nama": "Makanan Restoran", "icon": Icons.restaurant},

    {"nama": "Bahan Masak", "icon": Icons.kitchen},

    {"nama": "Makanan Cepat Saji", "icon": Icons.fastfood},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Food Rescue")),

      body: ListView.builder(
        itemCount: kategoriFoodRescue.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: Icon(
                kategoriFoodRescue[index]["icon"],
                color: Colors.green,
              ),

              title: Text(kategoriFoodRescue[index]["nama"]),
            ),
          );
        },
      ),
    );
  }
}
