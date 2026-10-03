import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  final List<Map<String, dynamic>> pilar = const [
    {
      'nama': 'Smart Governance',
      'deskripsi': 'Pelayanan pemerintahan digital',
      'icon': Icons.account_balance,
      'warna': Colors.blue,
    },
    {
      'nama': 'Smart Branding',
      'deskripsi': 'Promosi potensi dan budaya kota',
      'icon': Icons.campaign,
      'warna': Colors.orange,
    },
    {
      'nama': 'Smart Economy',
      'deskripsi': 'Pengembangan ekonomi digital',
      'icon': Icons.trending_up,
      'warna': Colors.green,
    },
    {
      'nama': 'Smart Living',
      'deskripsi': 'Kualitas hidup masyarakat',
      'icon': Icons.home_work,
      'warna': Colors.purple,
    },
    {
      'nama': 'Smart Society',
      'deskripsi': 'Masyarakat yang cerdas dan terhubung',
      'icon': Icons.groups,
      'warna': Colors.teal,
    },
    {
      'nama': 'Smart Environment',
      'deskripsi': 'Lingkungan kota berkelanjutan',
      'icon': Icons.eco,
      'warna': Colors.lightGreen,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_city,
                  color: Colors.white,
                  size: 42,
                ),
                SizedBox(height: 16),
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Nusantara Cerdas Mobile',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Satu aplikasi untuk berbagai layanan publik.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Enam Pilar Smart City',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final jumlahKolom =
                  constraints.maxWidth >= 800 ? 3 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pilar.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: jumlahKolom,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  final item = pilar[index];

                  return Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: item['warna'] as Color,
                            size: 34,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['nama'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['deskripsi'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}