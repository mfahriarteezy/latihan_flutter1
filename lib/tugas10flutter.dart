import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendaftaran Aplikasi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormPendaftaranPage(),
    );
  }
}

// Model Kelas untuk menampung data
class DataPendaftar {
  final String namaLengkap;
  final String email;
  final String noHp;
  final String kotaAsal;

  DataPendaftar({
    required this.namaLengkap,
    required this.email,
    required this.noHp,
    required this.kotaAsal,
  });
}

// 1. Halaman 1
class FormPendaftaranPage extends StatefulWidget {
  const FormPendaftaranPage({super.key});

  @override
  State<FormPendaftaranPage> createState() => _FormPendaftaranPageState();
}

class _FormPendaftaranPageState extends State<FormPendaftaranPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  void _showRingkasanDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ringkasan Data Pendaftaran'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Nama Lengkap: ${_namaController.text}'),
                Text('Email: ${_emailController.text}'),
                Text(
                  'Nomor HP: ${_noHpController.text.isEmpty ? "-" : _noHpController.text}',
                ),
                Text('Kota Asal: ${_kotaController.text}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                final dataKirim = DataPendaftar(
                  namaLengkap: _namaController.text,
                  email: _emailController.text,
                  noHp: _noHpController.text.isEmpty
                      ? "-"
                      : _noHpController.text,
                  kotaAsal: _kotaController.text,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanKonfirmasi(data: dataKirim),
                  ),
                );
              },
              child: const Text('Lanjut'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulir Pendaftaran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Input Nama Lengkap
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama lengkap wajib diisi!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email wajib diisi!';
                  }
                  if (!value.contains('@')) {
                    return 'Email harus mengandung karakter @';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input Nomor HP
              TextFormField(
                controller: _noHpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP (Opsional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Input Kota Asal
              TextFormField(
                controller: _kotaController,
                decoration: const InputDecoration(
                  labelText: 'Kota Asal *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kota asal wajib diisi!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Tombol Daftar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showRingkasanDialog();
                  }
                },
                child: const Text('Daftar', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. Halaman Kedua: Halaman Konfirmasi
class HalamanKonfirmasi extends StatelessWidget {
  // Menerima objek DataPendaftar
  final DataPendaftar data;

  const HalamanKonfirmasi({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konfirmasi Pendaftaran')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 80,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    'Terima kasih, ${data.namaLengkap} dari ${data.kotaAsal} telah mendaftar.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke screen sebelumnya
                    },
                    child: const Text('Kembali ke Form'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
