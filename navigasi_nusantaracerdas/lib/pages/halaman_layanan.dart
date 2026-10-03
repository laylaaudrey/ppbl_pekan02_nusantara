import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  static const List<Map<String, String>> perizinan = [
    {
      'nama': 'Izin Usaha',
      'dinas': 'Dinas Penanaman Modal',
      'jam': 'Senin-Jumat, 08.00-16.00',
      'deskripsi': 'Layanan pengajuan izin usaha bagi masyarakat.',
    },
    {
      'nama': 'Izin Mendirikan Bangunan',
      'dinas': 'Dinas Pekerjaan Umum',
      'jam': 'Senin-Jumat, 08.00-15.00',
      'deskripsi': 'Layanan perizinan pembangunan gedung.',
    },
    {
      'nama': 'Izin Keramaian',
      'dinas': 'Dinas Pelayanan Terpadu',
      'jam': 'Senin-Jumat, 08.00-15.00',
      'deskripsi': 'Layanan pengajuan izin kegiatan masyarakat.',
    },
  ];

  static const List<Map<String, String>> kesehatan = [
    {
      'nama': 'Pendaftaran Puskesmas',
      'dinas': 'Dinas Kesehatan',
      'jam': 'Senin-Sabtu, 08.00-14.00',
      'deskripsi': 'Layanan pendaftaran pemeriksaan kesehatan.',
    },
    {
      'nama': 'Konsultasi Kesehatan',
      'dinas': 'Dinas Kesehatan',
      'jam': 'Senin-Jumat, 08.00-15.00',
      'deskripsi': 'Layanan konsultasi kesehatan masyarakat.',
    },
    {
      'nama': 'Layanan Ambulans',
      'dinas': 'Dinas Kesehatan',
      'jam': '24 jam',
      'deskripsi': 'Layanan permintaan ambulans darurat.',
    },
  ];

  static const List<Map<String, String>> transportasi = [
    {
      'nama': 'Informasi Transportasi',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Setiap hari, 06.00-22.00',
      'deskripsi': 'Informasi transportasi umum di wilayah kota.',
    },
    {
      'nama': 'Pengaduan Lalu Lintas',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Senin-Jumat, 08.00-16.00',
      'deskripsi': 'Layanan pengaduan masalah lalu lintas.',
    },
    {
      'nama': 'Informasi Parkir',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Setiap hari, 06.00-22.00',
      'deskripsi': 'Informasi lokasi dan fasilitas parkir.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Layanan Publik'),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: Icon(Icons.assignment),
                    text: 'Perizinan',
                  ),
                  Tab(
                    icon: Icon(Icons.local_hospital),
                    text: 'Kesehatan',
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bus),
                    text: 'Transportasi',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _daftarLayanan(context, perizinan),
                _daftarLayanan(context, kesehatan),
                _daftarLayanan(context, transportasi),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _daftarLayanan(
    BuildContext context,
    List<Map<String, String>> data,
  ) {
    return Builder(
      builder: (context) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final layanan = data[index];

            return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE8EAF6),
                  child: Icon(
                    Icons.description,
                    color: Colors.indigo,
                  ),
                ),
                title: Text(
                  layanan['nama']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(layanan['dinas']!),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final hasil = await Navigator.pushNamed(
                    context,
                    AppRoutes.rincian,
                    arguments: layanan,
                  );

                  if (!context.mounted) return;

                  if (hasil is String) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(hasil),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}