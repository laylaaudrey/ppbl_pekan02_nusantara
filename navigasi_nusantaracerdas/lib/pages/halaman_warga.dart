import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Color(0xFFE8EAF6),
            child: Icon(
              Icons.person,
              size: 65,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Warga Nusantara',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Pengguna Aplikasi',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),
          Card(
            color: Colors.white,
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.badge, color: Colors.indigo),
                  title: Text('Nama'),
                  subtitle: Text('Warga Nusantara'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.indigo),
                  title: Text('Email'),
                  subtitle: Text('warga@email.com'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.indigo),
                  title: Text('Alamat'),
                  subtitle: Text('Kota Nusantara'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.riwayat,
                );
              },
              icon: const Icon(Icons.history),
              label: const Text('Riwayat Laporan'),
            ),
          ),
        ],
      ),
    );
  }
}