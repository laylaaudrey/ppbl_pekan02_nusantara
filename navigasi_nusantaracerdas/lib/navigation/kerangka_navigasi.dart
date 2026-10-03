import 'package:flutter/material.dart';

import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  final List<Widget> halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<NavigationDestination> tujuan = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Beranda',
    ),
    NavigationDestination(
      icon: Icon(Icons.apps_outlined),
      selectedIcon: Icon(Icons.apps),
      label: 'Layanan',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'Warga',
    ),
  ];

  void ubahHalaman(int indeks) {
    setState(() {
      indeksAktif = indeks;
    });
  }

  Future<void> bukaMenuSamping() async {
    final pilihan = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text(
                  'Nusantara Cerdas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('Menu navigasi'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Beranda'),
                onTap: () => Navigator.pop(context, 0),
              ),
              ListTile(
                leading: const Icon(Icons.apps),
                title: const Text('Layanan'),
                onTap: () => Navigator.pop(context, 1),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Warga'),
                onTap: () => Navigator.pop(context, 2),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Pengaturan Kota'),
                onTap: () => Navigator.pop(context, 3),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Tentang Aplikasi'),
                onTap: () => Navigator.pop(context, 4),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Keluar'),
                onTap: () => Navigator.pop(context, 5),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted || pilihan == null) return;

    if (pilihan >= 0 && pilihan <= 2) {
      ubahHalaman(pilihan);
    } else if (pilihan == 3) {
      Navigator.pushNamed(context, AppRoutes.pengaturan);
    } else if (pilihan == 4) {
      Navigator.pushNamed(context, AppRoutes.tentang);
    } else if (pilihan == 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Anda telah memilih menu Keluar.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final layarLebar = lebar >= 600;

    return WillPopScope(
      onWillPop: () async {
        if (indeksAktif != 0) {
          setState(() {
            indeksAktif = 0;
          });
          return false;
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: bukaMenuSamping,
              icon: const Icon(Icons.menu),
              tooltip: 'Menu',
            ),
          ],
        ),
        body: Row(
          children: [
            if (layarLebar)
              NavigationRail(
                selectedIndex: indeksAktif,
                onDestinationSelected: ubahHalaman,
                labelType: NavigationRailLabelType.all,
                extended: lebar >= 900,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Beranda'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.apps_outlined),
                    selectedIcon: Icon(Icons.apps),
                    label: Text('Layanan'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: Text('Warga'),
                  ),
                ],
              ),
            Expanded(
              child: IndexedStack(
                index: indeksAktif,
                children: halaman,
              ),
            ),
          ],
        ),
        bottomNavigationBar: layarLebar
            ? null
            : NavigationBar(
                selectedIndex: indeksAktif,
                onDestinationSelected: ubahHalaman,
                destinations: tujuan,
              ),
      ),
    );
  }
}