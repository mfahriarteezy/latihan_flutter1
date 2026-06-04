import 'package:chronicles/extension/extension.dart';
import 'package:flutter/material.dart';

import 'tugas6flutter.dart';

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
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  bool _modeGelapUtama = false;

  void _toggleTheme(bool value) {
    setState(() {
      _modeGelapUtama = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final warnaBg = _modeGelapUtama
        ? const Color(0xFF000000)
        : const Color(0xFFF9FBF9);
    final warnaPermukaan = _modeGelapUtama
        ? const Color(0xFF121212)
        : Colors.white;
    final warnaUtama = _modeGelapUtama
        ? const Color(0xFF12C782)
        : const Color(0xFF0EA76D);
    final warnaTeksUtama = _modeGelapUtama
        ? Colors.white
        : const Color(0xFF2C3E35);
    final warnaTeksSekunder = _modeGelapUtama ? Colors.white60 : Colors.black54;
    final warnaBorder = _modeGelapUtama ? Colors.white10 : Colors.black12;

    final List<Widget> pages = [
      FormInteraktifPage(
        modeGelap: _modeGelapUtama,
        onThemeChanged: _toggleTheme,
        warnaBg: warnaBg,
        warnaPermukaan: warnaPermukaan,
        warnaUtama: warnaUtama,
        warnaTeksUtama: warnaTeksUtama,
        warnaTeksSekunder: warnaTeksSekunder,
        warnaBorder: warnaBorder,
      ),
      TentangPage(
        warnaBg: warnaBg,
        warnaPermukaan: warnaPermukaan,
        warnaUtama: warnaUtama,
        warnaTeksUtama: warnaTeksUtama,
        warnaTeksSekunder: warnaTeksSekunder,
        warnaBorder: warnaBorder,
      ),
    ];

    return Scaffold(
      backgroundColor: warnaBg,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _currentIndex == 0 ? "Food Rescue" : "Tentang Aplikasi",
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
          IconButton(
            icon: Icon(_modeGelapUtama ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() => _modeGelapUtama = !_modeGelapUtama);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: warnaBorder, height: 1),
        ),
      ),

      drawer: _currentIndex == 0
          ? Drawer(
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
                        color: _modeGelapUtama ? warnaBg : Colors.white,
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
                    context,
                  ),
                  _buildDrawerItem(
                    Icons.dark_mode_outlined,
                    "Mode Tampilan",
                    warnaTeksUtama,
                    context,
                  ),
                  _buildDrawerItem(
                    Icons.fastfood_outlined,
                    "Kategori Donasi",
                    warnaTeksUtama,
                    context,
                  ),
                  _buildDrawerItem(
                    Icons.calendar_today_outlined,
                    "Tanggal Kedaluwarsa",
                    warnaTeksUtama,
                    context,
                  ),
                  _buildDrawerItem(
                    Icons.schedule_outlined,
                    "Waktu Penjemputan",
                    warnaTeksUtama,
                    context,
                  ),

                  // Item Logout yang sudah diperbaiki
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Memanggil fungsi navigasi menuju halaman login kamu
                      context.pushAndRemoveAll(const LoginPage1());
                    },
                  ),
                ],
              ),
            )
          : null,
      body: pages[_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: warnaBorder, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: warnaPermukaan,
          selectedItemColor: warnaUtama,
          unselectedItemColor: warnaTeksSekunder,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    Color warnaTeks,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(icon, size: 20, color: warnaTeks.withOpacity(0.7)),
      title: Text(title, style: TextStyle(fontSize: 14, color: warnaTeks)),
      onTap: () => Navigator.pop(context),
    );
  }
}

// ================= TAB 1: HALAMAN HOME =================
class FormInteraktifPage extends StatefulWidget {
  final bool modeGelap;
  final ValueChanged<bool> onThemeChanged;
  final Color warnaBg;
  final Color warnaPermukaan;
  final Color warnaUtama;
  final Color warnaTeksUtama;
  final Color warnaTeksSekunder;
  final Color warnaBorder;

  const FormInteraktifPage({
    super.key,
    required this.modeGelap,
    required this.onThemeChanged,
    required this.warnaBg,
    required this.warnaPermukaan,
    required this.warnaUtama,
    required this.warnaTeksUtama,
    required this.warnaTeksSekunder,
    required this.warnaBorder,
  });

  @override
  State<FormInteraktifPage> createState() => _FormInteraktifPageState();
}

class _FormInteraktifPageState extends State<FormInteraktifPage> {
  bool setujuDonasi = false;
  String kategoriDonasi = "Makanan Siap Saji";
  DateTime? tanggalKedaluwarsa;
  TimeOfDay? waktuPenjemputan;

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

  String formatTanggal(DateTime? date) {
    if (date == null) return "Belum dipilih";
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  String formatWaktu(TimeOfDay? time) {
    if (time == null) return "Belum diatur";
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Persyaratan Layanan", widget.warnaTeksSekunder),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: setujuDonasi,
              activeColor: widget.warnaUtama,
              checkColor: widget.warnaPermukaan,
              title: Text(
                "Makanan dalam kondisi masih layak untuk dikonsumsi",
                style: TextStyle(fontSize: 15, color: widget.warnaTeksUtama),
              ),
              onChanged: (val) => setState(() => setujuDonasi = val ?? false),
            ),
            Text(
              setujuDonasi
                  ? "✓ Donasi siap diproses"
                  : "✕ Anda perlu menyetujui persyaratan",
              style: TextStyle(
                color: setujuDonasi ? widget.warnaUtama : Colors.redAccent,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 28),

            _buildSectionTitle("Mode Tampilan", widget.warnaTeksSekunder),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: widget.modeGelap,
              activeThumbColor: widget.warnaUtama,
              title: Text(
                widget.modeGelap ? "Dark Mode" : "Light Mode",
                style: TextStyle(fontSize: 15, color: widget.warnaTeksUtama),
              ),
              secondary: Icon(
                widget.modeGelap ? Icons.dark_mode : Icons.light_mode,
                color: widget.warnaUtama,
              ),
              onChanged: (val) {
                widget.onThemeChanged(val);
              },
            ),
            const SizedBox(height: 28),

            _buildSectionTitle(
              "Kategori Donasi Makanan",
              widget.warnaTeksSekunder,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: widget.warnaPermukaan,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: widget.warnaBorder),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: kategoriDonasi,
                  isExpanded: true,
                  dropdownColor: widget.warnaPermukaan,
                  style: TextStyle(color: widget.warnaTeksUtama, fontSize: 15),
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

            _buildSectionTitle(
              "Logistik Pendistribusian",
              widget.warnaTeksSekunder,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: widget.warnaBorder),
                      backgroundColor: widget.warnaPermukaan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: pilihTanggal,
                    icon: Icon(
                      Icons.event_note,
                      color: widget.warnaUtama,
                      size: 18,
                    ),
                    label: Text(
                      tanggalKedaluwarsa == null
                          ? "Batas Segar"
                          : formatTanggal(tanggalKedaluwarsa),
                      style: TextStyle(
                        color: widget.warnaTeksUtama,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: widget.warnaBorder),
                      backgroundColor: widget.warnaPermukaan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: pilihWaktu,
                    icon: Icon(
                      Icons.lock_clock,
                      color: widget.warnaUtama,
                      size: 18,
                    ),
                    label: Text(
                      waktuPenjemputan == null
                          ? "Jam Jemput"
                          : formatWaktu(waktuPenjemputan),
                      style: TextStyle(
                        color: widget.warnaTeksUtama,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            _buildSectionTitle("Ringkasan Manifes", widget.warnaTeksSekunder),
            const SizedBox(height: 10),
            _RingkasanCard(
              warnaUtama: widget.warnaUtama,
              warnaPermukaan: widget.warnaPermukaan,
              warnaTeksUtama: widget.warnaTeksUtama,
              warnaTeksSekunder: widget.warnaTeksSekunder,
              setuju: setujuDonasi,
              kategori: kategoriDonasi,
              tanggalBatas: formatTanggal(tanggalKedaluwarsa),
              waktuJemput: formatWaktu(waktuPenjemputan),
            ),
          ],
        ),
      ),
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

// ================= TAB 2: HALAMAN TENTANG APLIKASI =================
class TentangPage extends StatelessWidget {
  final Color warnaBg;
  final Color warnaPermukaan;
  final Color warnaUtama;
  final Color warnaTeksUtama;
  final Color warnaTeksSekunder;
  final Color warnaBorder;

  const TentangPage({
    super.key,
    required this.warnaBg,
    required this.warnaPermukaan,
    required this.warnaUtama,
    required this.warnaTeksUtama,
    required this.warnaTeksSekunder,
    required this.warnaBorder,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: warnaPermukaan,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: warnaBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.volunteer_activism, size: 64, color: warnaUtama),
                const SizedBox(height: 16),
                Text(
                  "Food Rescue",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: warnaTeksUtama,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Mari mengurangi food waste dan mulai memberikan makanan yang masih layak kepada yang membutuhkan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: warnaTeksSekunder,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                Divider(height: 32, thickness: 1, color: warnaBorder),
                _buildInfoRow(
                  "Pembuat",
                  "Tim Relawan Food Rescue",
                  warnaTeksUtama,
                  warnaTeksSekunder,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  "Versi Aplikasi",
                  "v2.1.0-Tugas8mohamadfahri",
                  warnaTeksUtama,
                  warnaTeksSekunder,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    Color warnaTeks,
    Color warnaSekunder,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: warnaSekunder, fontSize: 13)),
        Text(
          value,
          style: TextStyle(
            color: warnaTeks,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

// ================= WIDGET MANIFES CARD =================
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
