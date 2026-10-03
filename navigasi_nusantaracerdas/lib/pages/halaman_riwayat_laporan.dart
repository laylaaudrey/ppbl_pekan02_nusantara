import 'package:flutter/material.dart';

class HalamanRiwayatLaporan extends StatefulWidget {
  const HalamanRiwayatLaporan({super.key});

  @override
  State<HalamanRiwayatLaporan> createState() =>
      _HalamanRiwayatLaporanState();
}

class _HalamanRiwayatLaporanState
    extends State<HalamanRiwayatLaporan> {
  final List<String> laporan = [
    'Jalan rusak di wilayah kota',
    'Lampu jalan tidak menyala',
    'Sampah menumpuk di lingkungan',
  ];

  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: laporan.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE8EAF6),
                child: Icon(
                  Icons.report_problem,
                  color: Colors.indigo,
                ),
              ),
              title: Text(laporan[index]),
              subtitle: const Text('Status: Dalam proses'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            laporan.add('Laporan baru');
          });
          tampilkanPesan('Laporan baru berhasil ditambahkan.');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => tampilkanPesan('Menu Beranda'),
              icon: const Icon(Icons.home),
              tooltip: 'Beranda',
            ),
            IconButton(
              onPressed: () => tampilkanPesan('Menu Laporan'),
              icon: const Icon(Icons.assignment),
              tooltip: 'Laporan',
            ),
            const SizedBox(width: 48),
            IconButton(
              onPressed: () => tampilkanPesan('Menu Notifikasi'),
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifikasi',
            ),
            IconButton(
              onPressed: () => tampilkanPesan('Menu Profil'),
              icon: const Icon(Icons.person),
              tooltip: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}