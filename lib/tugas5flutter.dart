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
      title: 'Food Rescue',
      theme: ThemeData.dark(),
      home: const FoodRescuePage(),
    );
  }
}

class FoodRescuePage extends StatefulWidget {
  const FoodRescuePage({super.key});

  @override
  State<FoodRescuePage> createState() => _FoodRescuePageState();
}

class _FoodRescuePageState extends State<FoodRescuePage> {
  // STATE
  bool tampilPesan = false;
  bool isFavorite = false;
  bool tampilDeskripsi = false;

  String pesanInkWell = "";

  int jumlahMakanan = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      //APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Food Rescue",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),

      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          setState(() {
            jumlahMakanan--;
          });

          print("Jumlah makanan dikurangi");
        },
        child: const Icon(Icons.remove),
      ),

      //  BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //  HEADER
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Icon(Icons.food_bank, size: 70, color: Colors.orange),

                  SizedBox(height: 15),

                  Text(
                    "Save Food,\nSave Humanity",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Kurangi food waste dan bantu sesama melalui donasi makanan.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, height: 1.5),
                  ),
                ],
              ),
            ),

            //  ELEVATED BUTTON
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    "Donasi Makanan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        tampilPesan = !tampilPesan;
                      });
                    },
                    child: const Text(
                      "Klik Untuk Donasi",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 15),

                  if (tampilPesan)
                    const Text(
                      "Terima kasih sudah berdonasi 🍱",
                      style: TextStyle(color: Colors.white70),
                    ),
                ],
              ),
            ),

            //  ICON BUTTON
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    "Favoritkan Program",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  IconButton(
                    iconSize: 45,
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),

                  Text(
                    isFavorite
                        ? "Program favorit tersimpan ❤️"
                        : "Belum ditambahkan",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            //  TEXT BUTTON
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    "Tentang Food Rescue",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        tampilDeskripsi = !tampilDeskripsi;
                      });
                    },
                    child: const Text(
                      "Lihat Detail",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),

                  if (tampilDeskripsi)
                    const Text(
                      "Food Rescue membantu restoran dan masyarakat mendonasikan makanan berlebih kepada orang yang membutuhkan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, height: 1.5),
                    ),
                ],
              ),
            ),

            //  INKWELL
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    "Area Distribusi",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.orange,
                    onTap: () {
                      setState(() {
                        pesanInkWell = "Volunteer sedang menuju lokasi 🚚";
                      });

                      print("Area distribusi disentuh");
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Sentuh Area Distribusi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    pesanInkWell,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            //  GESTURE DETECTOR
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    "Makanan Terselamatkan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        jumlahMakanan += 1;
                      });

                      print("Ditekan sekali");
                    },

                    onDoubleTap: () {
                      setState(() {
                        jumlahMakanan += 2;
                      });

                      print("Ditekan dua kali");
                    },

                    onLongPress: () {
                      setState(() {
                        jumlahMakanan += 3;
                      });

                      print("Tahan lama");
                    },

                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          "$jumlahMakanan",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Tap = +1\nDouble Tap = +2\nLong Press = +3",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
