import 'package:flutter/material.dart';

class HalamanRincianLayanan extends StatelessWidget {
  final Map<String, String> layanan;

  const HalamanRincianLayanan({
    super.key,
    required this.layanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Layanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFE8EAF6),
                child: Icon(
                  Icons.description,
                  size: 45,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                layanan['nama'] ?? 'Nama layanan',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _informasi(
              Icons.account_balance,
              'Dinas Penanggung Jawab',
              layanan['dinas'] ?? '-',
            ),
            _informasi(
              Icons.access_time,
              'Jam Operasional',
              layanan['jam'] ?? '-',
            ),
            _informasi(
              Icons.info_outline,
              'Keterangan',
              layanan['deskripsi'] ?? '-',
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    'Permohonan ${layanan['nama']} telah diajukan.',
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _informasi(
    IconData ikon,
    String judul,
    String isi,
  ) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          ikon,
          color: Colors.indigo,
        ),
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(isi),
        ),
      ),
    );
  }
}