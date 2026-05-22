import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Rescue',
      // Home dipanggil langsung tanpa parameter apa pun
      home: InputInteraktifPage(),
    );
  }
}

class InputInteraktifPage extends StatefulWidget {
  const InputInteraktifPage({super.key});

  @override
  State<InputInteraktifPage> createState() => _InputInteraktifPageState();
}

class _InputInteraktifPageState extends State<InputInteraktifPage> {
  // ================== STATE VARIABLES ==================
  bool setujuDonasi = false;
  bool modeGelap = false; // Mengontrol tema lokal di sini
  String kategoriDonasi = "Makanan Siap Saji";
  DateTime? tanggalKedaluwarsa;
  TimeOfDay? waktuPenjemputan;

  // ================== HELPER METHODS ==================
  Future<void> pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (hasil != null) setState(() => tanggalKedaluwarsa = hasil);
  }

  Future<void> pilihWaktu() async {
    final hasil = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (hasil != null) setState(() => waktuPenjemputan = hasil);
  }

  String formatTanggal(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  String formatWaktu(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    // ================== KONFIGURASI WARNA MANDIRI ==================
    // LIGHT MODE: Kombinasi hijau mint pastel yang enak dilihat dan teduh
    // DARK MODE: Hitam pekat amoled murni dengan teks putih bersih

    final warnaBg = modeGelap
        ? const Color(0xFF000000)
        : const Color(0xFFF9FBF9);
    final warnaPermukaan = modeGelap ? const Color(0xFF121212) : Colors.white;
    final warnaUtama = modeGelap
        ? const Color(0xFF12C782)
        : const Color(0xFF0EA76D);
    final warnaTeksUtama = modeGelap ? Colors.white : const Color(0xFF2C3E35);
    final warnaTeksSekunder = modeGelap ? Colors.white60 : Colors.black54;
    final warnaBorder = modeGelap ? Colors.white10 : Colors.black12;

    return Scaffold(
      backgroundColor: warnaBg,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Rescue",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: warnaTeksUtama,
          ),
        ),
        backgroundColor: warnaPermukaan,
        elevation: 0,
        iconTheme: IconThemeData(color: warnaTeksUtama),
        actions: [
          // Shortcut ganti tema via icon di pojok kanan atas
          IconButton(
            icon: Icon(modeGelap ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() => modeGelap = !modeGelap);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: warnaBorder, height: 1),
        ),
      ),

      // ================== DRAWER ==================
      drawer: Drawer(
        backgroundColor: warnaPermukaan,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: warnaUtama),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.volunteer_activism,
                  size: 32,
                  color: modeGelap ? warnaBg : Colors.white,
                ),
              ),
              accountName: const Text(
                "Menu Donasi Makanan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              accountEmail: const Text(
                "relawan@foodrescue.id",
                style: TextStyle(color: Colors.white),
              ),
            ),
            _buildDrawerItem(
              Icons.verified_user_outlined,
              "Syarat Kelayakan",
              warnaTeksUtama,
            ),
            _buildDrawerItem(
              Icons.dark_mode_outlined,
              "Mode Tampilan",
              warnaTeksUtama,
            ),
            _buildDrawerItem(
              Icons.fastfood_outlined,
              "Kategori Donasi",
              warnaTeksUtama,
            ),
            _buildDrawerItem(
              Icons.calendar_today_outlined,
              "Tanggal Kedaluwarsa",
              warnaTeksUtama,
            ),
            _buildDrawerItem(
              Icons.schedule_outlined,
              "Waktu Penjemputan",
              warnaTeksUtama,
            ),
          ],
        ),
      ),

      // ================== BODY ==================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Kelayakan Donasi
              _buildSectionTitle("Persyaratan Layanan", warnaTeksSekunder),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: setujuDonasi,
                activeColor: warnaUtama,
                checkColor: warnaPermukaan,
                title: Text(
                  "Makanan dalam kondisi masih layak untuk dikonsumsi",
                  style: TextStyle(fontSize: 15, color: warnaTeksUtama),
                ),
                onChanged: (val) => setState(() => setujuDonasi = val ?? false),
              ),
              Text(
                setujuDonasi
                    ? "✓ Donasi siap diproses"
                    : "✕ Anda perlu menyetujui persyaratan",
                style: TextStyle(
                  color: setujuDonasi ? warnaUtama : Colors.redAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 28),

              // Section 2: Switch Pengubah Tema Mandiri
              _buildSectionTitle("Mode Tampilan", warnaTeksSekunder),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: modeGelap,
                activeThumbColor: warnaUtama,
                title: Text(
                  modeGelap ? "Dark Mode" : "Light Mode",
                  style: TextStyle(fontSize: 15, color: warnaTeksUtama),
                ),
                secondary: Icon(
                  modeGelap ? Icons.dark_mode : Icons.light_mode,
                  color: warnaUtama,
                ),
                onChanged: (val) {
                  setState(() => modeGelap = val);
                },
              ),
              const SizedBox(height: 28),

              // Section 3: Dropdown Kategori Donasi
              _buildSectionTitle("Kategori Donasi Makanan", warnaTeksSekunder),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: warnaPermukaan,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: warnaBorder),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: kategoriDonasi,
                    isExpanded: true,
                    dropdownColor: warnaPermukaan,
                    style: TextStyle(color: warnaTeksUtama, fontSize: 15),
                    items:
                        [
                              "Makanan Siap Saji",
                              "Bahan Makanan Pokok",
                              "Sayur & Buah Segar",
                              "Roti & Kue",
                            ]
                            .map(
                              (String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                    onChanged: (val) => setState(() => kategoriDonasi = val!),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Section 4 & 5: Logistik (Tanggal & Waktu)
              _buildSectionTitle("Logistik Pendistribusian", warnaTeksSekunder),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: warnaBorder),
                        backgroundColor: warnaPermukaan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: pilihTanggal,
                      icon: Icon(Icons.event_note, color: warnaUtama, size: 18),
                      label: Text(
                        "Batas Segar",
                        style: TextStyle(color: warnaTeksUtama, fontSize: 13),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: warnaBorder),
                        backgroundColor: warnaPermukaan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: pilihWaktu,
                      icon: Icon(Icons.lock_clock, color: warnaUtama, size: 18),
                      label: Text(
                        "Jam Jemput",
                        style: TextStyle(color: warnaTeksUtama, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),

              // ================== SUMMARY AREA ==================
              _RingkasanCard(
                warnaUtama: warnaUtama,
                warnaPermukaan: warnaPermukaan,
                warnaTeksUtama: warnaTeksUtama,
                warnaTeksSekunder: warnaTeksSekunder,
                setuju: setujuDonasi,
                kategori: kategoriDonasi,
                tanggalBatas: tanggalKedaluwarsa != null
                    ? formatTanggal(tanggalKedaluwarsa!)
                    : "-",
                waktuJemput: waktuPenjemputan != null
                    ? formatWaktu(waktuPenjemputan!)
                    : "-",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Color warnaTeks) {
    return ListTile(
      leading: Icon(icon, size: 20, color: warnaTeks.withOpacity(0.7)),
      title: Text(title, style: TextStyle(fontSize: 14, color: warnaTeks)),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget _buildSectionTitle(String title, Color warnaTeks) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: warnaTeks,
        letterSpacing: 0.8,
      ),
    );
  }
}

// Widget Komponen Ringkasan Manifes Donasi
class _RingkasanCard extends StatelessWidget {
  final Color warnaUtama;
  final Color warnaPermukaan;
  final Color warnaTeksUtama;
  final Color warnaTeksSekunder;
  final bool setuju;
  final String kategori;
  final String tanggalBatas;
  final String waktuJemput;

  const _RingkasanCard({
    required this.warnaUtama,
    required this.warnaPermukaan,
    required this.warnaTeksUtama,
    required this.warnaTeksSekunder,
    required this.setuju,
    required this.kategori,
    required this.tanggalBatas,
    required this.waktuJemput,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: warnaPermukaan,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: warnaUtama.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.assignment_outlined, color: warnaUtama, size: 18),
              const SizedBox(width: 8),
              Text(
                "Manifes Donasi Makanan",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: warnaTeksUtama,
                ),
              ),
            ],
          ),
          Divider(
            height: 24,
            thickness: 1,
            color: warnaUtama.withOpacity(0.15),
          ),
          _buildRowInfo(
            "Status Layak",
            setuju ? "Konfirmasi Layak" : "Belum Diverifikasi",
          ),
          _buildRowInfo("Jenis Makanan", kategori),
          _buildRowInfo("Batas Kedaluwarsa", tanggalBatas),
          _buildRowInfo("Estimasi Penjemputan", waktuJemput),
        ],
      ),
    );
  }

  Widget _buildRowInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: warnaTeksSekunder, fontSize: 13)),
          Text(
            value,
            style: TextStyle(
              color: warnaTeksUtama,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
