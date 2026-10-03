import 'package:flutter/material.dart';

import '../pages/halaman_rincian_layanan.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_tentang.dart';
import '../pages/halaman_route_tidak_dikenal.dart';
import 'kerangka_navigasi.dart';
import '../pages/halaman_riwayat_laporan.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';
  static const String rincian = '/rincian';
  static const String riwayat = '/riwayat';
  static const String routeSalah = '/route-salah';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      pengaturan: (context) => const HalamanPengaturan(),
      tentang: (context) => const HalamanTentang(),
      riwayat: (context) => const HalamanRiwayatLaporan(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    switch (settings.name) {
      case beranda:
        return MaterialPageRoute(
          builder: (context) => const KerangkaNavigasi(),
          settings: settings,
        );

      case rincian:
        final data = settings.arguments;

        if (data is Map<String, String>) {
          return MaterialPageRoute(
            builder: (context) => HalamanRincianLayanan(
              layanan: data,
            ),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (context) => const HalamanRouteTidakDikenal(),
          settings: settings,
        );

      case routeSalah:
        return MaterialPageRoute(
          builder: (context) => const HalamanRouteTidakDikenal(),
          settings: settings,
        );

      default:
        return null;
    }
  }

  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) => HalamanRouteTidakDikenal(
        namaRoute: settings.name,
      ),
      settings: settings,
    );
  }
}