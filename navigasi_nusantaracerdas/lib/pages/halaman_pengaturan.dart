import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() =>
      _HalamanPengaturanState();
}

class _HalamanPengaturanState extends State<HalamanPengaturan> {
  bool notifikasiAktif = true;
  bool modeGelap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            subtitle: const Text('Aktifkan pemberitahuan aplikasi'),
            value: notifikasiAktif,
            onChanged: (nilai) {
              setState(() {
                notifikasiAktif = nilai;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Mode Gelap'),
            subtitle: const Text('Ubah tampilan aplikasi'),
            value: modeGelap,
            onChanged: (nilai) {
              setState(() {
                modeGelap = nilai;
              });
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Informasi Kota'),
            subtitle: Text('Nusantara'),
          ),
        ],
      ),
    );
  }
}