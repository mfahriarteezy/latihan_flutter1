import 'package:flutter/material.dart';

void main() => runApp(const JuggernautProfile());

class JuggernautProfile extends StatelessWidget {
  const JuggernautProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Menggunakan tema gelap agar nuansa Dota 2 lebih terasa
      home: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A), // Hitam pekat khas dashboard Dota
        // 1. Header (AppBar)
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),
            
            // 2. Identitas Utama
            const Center(
              child: Text(
                "YURNERO THE JUGGERNAUT",
                style: TextStyle(
                  fontSize: 26, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD54F), // Warna emas/kuning pedang
                ),
              ),
            ),
            
            // 3. Detail Kontak (ID User / Pro Player)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.verified_user, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text("Pro Player ID: 88472910", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            // 4. Informasi Pendukung (Role & Difficulty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: const [
                  Icon(Icons.shield, color: Colors.red), // Menggunakan placeholder icon
                  Text(" Carry - Melee", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(), 
                  Text("Difficulty: "),
                  Text("⭐⭐", style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 5. Statistik Horizontal (Expanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("STR: 20 + 2.2", textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("AGI: 34 + 2.8", textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("INT: 14 + 1.4", textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),

            // 6. Deskripsi Naratif
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Yurnero is a high-damage melee agility hero, capable of devastating enemies in a flurry of blade strikes. He is known for his signature ultimate, Omnislash, and his ability to become immune to magic during Blade Fury.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white60, fontStyle: FontStyle.italic),
              ),
            ),

            const Spacer(),

            // 7. Visual Branding (Banner Bawah)
            Container(
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFFB71C1C)],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.shield, 
                  size: 100, 
                  color: Colors.white24
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}