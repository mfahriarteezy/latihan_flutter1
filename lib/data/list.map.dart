// TUGAS 3: Model 

class PaketDonasi {
  final String judul;
  final String deskripsi;

  final int porsi;

  const PaketDonasi({
    required this.judul,
    required this.deskripsi,

    required this.porsi,
  });
}

// Data Objek 
const List<PaketDonasi> daftarDonasi = [
  PaketDonasi(
    judul: 'Surplus Roti Manis & Croissant',
    deskripsi:
        'Donasi dari Bakeri lokal, kondisi sangat baik & layak makan hari ini.',

    porsi: 15,
  ),
  PaketDonasi(
    judul: 'Paket Sayuran Sop Kompleks',
    deskripsi:
        'Sisa display supermarket pagi ini, masih segar dan siap diolah.',

    porsi: 10,
  ),
  PaketDonasi(
    judul: 'Nasi Kotak Ayam Bakar',
    deskripsi: 'Kelebihan porsi pesanan acara seminar, dikemas higienis.',

    porsi: 8,
  ),
  PaketDonasi(
    judul: 'Buah Pisang & Apel Cuci Gudang',
    deskripsi: 'Kulit sedikit kecokelatan namun daging buah manis sempurna.',

    porsi: 20,
  ),
  PaketDonasi(
    judul: 'Susu UHT & Yogurt Kemasan',
    deskripsi: 'Mendekati tanggal kedaluwarsa (1 minggu lagi), segel utuh.',

    porsi: 12,
  ),
  PaketDonasi(
    judul: 'Donat Aneka Rasa Premium',
    deskripsi: 'Sisa penjualan toko mall hari ini, masih empuk dan higienis.',

    porsi: 25,
  ),
  PaketDonasi(
    judul: 'Lauk Pauk Matang (Orek Tempe)',
    deskripsi:
        'Dari katering rumah tangga bersih, diselamatkan sebelum kedai tutup.',

    porsi: 6,
  ),
  PaketDonasi(
    judul: 'Bahan Sembako (Beras & Mi Instan)',
    deskripsi:
        'Kemasan luar sedikit rusak di gudang, isi 100% aman dikonsumsi.',

    porsi: 30,
  ),
  PaketDonasi(
    judul: 'Kentang Potong Beku',
    deskripsi: 'Kelebihan stok restoran cepat saji, disimpan dalam freezer.',

    porsi: 14,
  ),
  PaketDonasi(
    judul: 'Bubur Ayam Sehat Organik',
    deskripsi: 'Porsi katering sarapan pagi yang tidak diambil konsumen.',

    porsi: 5,
  ),
];
